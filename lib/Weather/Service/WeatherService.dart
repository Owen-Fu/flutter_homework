import 'package:flutter_homework/Config/Config.dart';
import 'package:flutter_homework/Tool/Net/api.dart';
import 'package:flutter_homework/Tool/Net/requester.dart';
import 'package:flutter_homework/Weather/Model/RestDatastoreNormalModel.dart';

class WeatherService {
  Future<RestDatastoreNormalModel?> getWeatherNormal({String? cityName}) {
    return Requester.ins
        .get(Api.restDatastoreNormal, parameters: {'Authorization': Config.ins.weatherKey, 'locationName': cityName});
  }
}
