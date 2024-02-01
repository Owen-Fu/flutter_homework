import 'package:flutter/material.dart';
import 'package:flutter_homework/Weather/View/WeatherComponent/WeatherError.dart';
import 'package:flutter_homework/Weather/View/WeatherComponent/WeatherInit.dart';
import 'package:flutter_homework/Weather/View/WeatherComponent/WeatherLoading.dart';
import 'package:flutter_homework/Weather/View/WeatherComponent/WeatherResult.dart';
import 'package:flutter_homework/Weather/ViewModel/WeatherViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherSearchPage extends ConsumerStatefulWidget {
  const WeatherSearchPage({super.key});

  @override
  ConsumerState<WeatherSearchPage> createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends ConsumerState<WeatherSearchPage> {
  late WeatherViewModel _viewModel;
  final TextEditingController _cityTextController = TextEditingController();
  final FocusNode _cityFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(weatherViewModel.notifier);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(weatherViewModel);
    return GestureDetector(
      onTap: () {
        _cityFocusNode.unfocus();
      },
      child: Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 50).w,
          child: Column(
            children: [
              _searchWidget(),
              const SizedBox(height: 10),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: _resultWidget(_viewModel.weatherPageState)))
            ],
          )),
    );
  }

  Widget _searchWidget() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: _cityFocusNode,
            decoration: const InputDecoration(
              hintText: "請輸入城市名稱",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black), //<-- SEE HERE
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.red),
              ),
            ),
            controller: _cityTextController,
            onChanged: (text) {
              _viewModel.city = text;
            },
            onSubmitted: (value) => _search(),
          ),
        ),
        GestureDetector(
          onTap: () => _search(),
          child: SizedBox(
              width: 80.w,
              child: const Center(
                child: Text('確認'),
              )),
        )
      ],
    );
  }

  Widget _resultWidget(WeatherPageState weatherPageState) {
    switch (weatherPageState) {
      case WeatherPageState.init:
        return const WeatherInit();
      case WeatherPageState.loading:
        return const WeatherLoading();
      case WeatherPageState.result:
        return const WeatherResult();
      case WeatherPageState.error:
        return WeatherError(type: _viewModel.errorType);
    }
  }

  void _search() {
    _cityFocusNode.unfocus();
    if (!_viewModel.searchKey.contains(_viewModel.city) && _viewModel.city.replaceAll(' ', '').isNotEmpty) {
      _viewModel.setInputError();
      return;
    }
    _viewModel.setLoadingState();
    _viewModel.getWeatherData(cityName: _viewModel.city);
  }
}
