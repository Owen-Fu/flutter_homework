import 'package:flutter/material.dart';
import 'package:flutter_homework/Weather/ViewModel/WeatherViewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherError extends StatelessWidget {
  WeatherError({super.key, this.type = ErrorType.input});

  final ErrorType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ErrorType.input:
        return _textWidget('請輸入正確的城市名稱');
      case ErrorType.other:
        return _textWidget('發生錯誤，請稍後再試');
    }
  }

  Widget _textWidget(String text) => Center(child: Text(text, style: TextStyle(color: Colors.red, fontSize: 15.sp)));
}
