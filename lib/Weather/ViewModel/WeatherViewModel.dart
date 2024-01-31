import 'package:flutter_homework/Weather/Model/RestDatastoreNormalModel.dart';
import 'package:flutter_homework/Weather/Service/WeatherService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum WeatherPageState {
  init,
  loading,
  result,
  error,
}

enum ErrorType { input, other }

class WeatherState {
  WeatherState({
    WeatherPageState? weatherPageState,
    ErrorType? errorType,
    List<Map<String, dynamic>>? weatherList,
    String? city,
  })  : weatherPageState = weatherPageState ?? WeatherPageState.init,
        errorType = errorType ?? ErrorType.input,
        weatherList = weatherList ?? [],
        city = city ?? '';

  WeatherPageState weatherPageState;
  ErrorType errorType;
  List<Map<String, dynamic>>? weatherList;
  String city;

  WeatherState copyWith({
    WeatherPageState? weatherPageState,
    ErrorType? errorType,
    List<Map<String, dynamic>>? weatherList,
    String? city,
  }) {
    return WeatherState(
        weatherPageState: weatherPageState ?? this.weatherPageState,
        errorType: errorType ?? this.errorType,
        weatherList: weatherList ?? this.weatherList,
        city: city ?? this.city);
  }
}

final weatherViewModel = NotifierProvider.autoDispose<WeatherViewModel, WeatherState>(() => WeatherViewModel());

class WeatherViewModel extends AutoDisposeNotifier<WeatherState> {
  final WeatherService _weatherService = WeatherService();
  final List<String> searchKey = [
    "宜蘭縣",
    "花蓮縣",
    "臺東縣",
    "澎湖縣",
    "金門縣",
    "連江縣",
    "臺北市",
    "新北市",
    "桃園市",
    "臺中市",
    "臺南市",
    "高雄市",
    "基隆市",
    "新竹縣",
    "新竹市",
    "苗栗縣",
    "彰化縣",
    "南投縣",
    "雲林縣",
    "嘉義縣",
    "嘉義市",
    "屏東縣",
  ];

  @override
  WeatherState build() => WeatherState();

  set weatherPageState(WeatherPageState value) => state = state.copyWith(weatherPageState: value);

  WeatherPageState get weatherPageState => state.weatherPageState;

  set errorType(ErrorType value) => state = state.copyWith(errorType: value);

  ErrorType get errorType => state.errorType;

  set weatherList(List<Map<String, dynamic>>? value) => state = state.copyWith(weatherList: value);

  List<Map<String, dynamic>>? get weatherList => state.weatherList;

  set city(String value) => state = state.copyWith(city: value);

  String get city => state.city;

  void setInputError() {
    errorType = ErrorType.input;
    weatherPageState = WeatherPageState.error;
  }

  void setLoadingState() => weatherPageState = WeatherPageState.loading;

  Future<RestDatastoreNormalModel?> getWeatherData({String? cityName}) =>
      _weatherService.getWeatherNormal(cityName: cityName).then((value) {
        weatherList = transformWeatherData(value?.toJson() ?? {});
        weatherPageState = WeatherPageState.result;
        return value;
      }).catchError((error) {
        weatherPageState = WeatherPageState.error;
        errorType = ErrorType.other;
        return null;
      });

  /// convert by chatgpt
  /// {
  ///   "locationName": "宜蘭縣",
  ///   "element": [
  ///     {
  ///       "startTime": "2024-02-01 12:00:00",
  ///      "endTime": "2024-02-01 18:00:00",
  ///       "Wx": "多雲",
  ///       "PoP": "10百分比",
  ///       "MinT": "13C",
  ///       "CI": "寒冷至稍有寒意",
  ///       "MaxT": "26C"
  ///     }
  ///   ]
  /// }
  List<Map<String, dynamic>> transformWeatherData(Map<String, dynamic> data) {
    List<Map<String, dynamic>> transformedData = [];

    for (var location in data['records']['location']) {
      Map<String, dynamic> locationEntry = {
        'locationName': location['locationName'],
        'element': [],
      };

      List<Map<String, dynamic>> timeEntries = [];
      Map<String, Map<String, String>> timeData = {};

      for (var weatherElement in location['weatherElement']) {
        for (var time in weatherElement['time']) {
          String startTime = time['startTime'];
          if (!timeData.containsKey(startTime)) {
            timeData[startTime] = {
              'startTime': startTime,
              'endTime': time['endTime'],
            };
          }
          timeData[startTime]?[weatherElement['elementName']] =
              "${time['parameter']['parameterName']}${weatherElement['elementName'] == 'PoP' ? '%' : weatherElement['elementName'] == 'MinT' || weatherElement['elementName'] == 'MaxT' ? '°C' : ''}";
        }
      }

      timeData.forEach((key, value) {
        timeEntries.add(value);
      });

      timeEntries.sort((a, b) => a['startTime'].compareTo(b['startTime']));
      locationEntry['element'] = timeEntries;
      transformedData.add(locationEntry);
    }

    return transformedData;
  }
}
