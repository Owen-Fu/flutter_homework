import 'package:flutter/material.dart';
import 'package:flutter_homework/Weather/ViewModel/WeatherViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherResult extends ConsumerWidget {
  const WeatherResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, dynamic>>? list = ref.watch(weatherViewModel.select((value) => value.weatherList));
    return ListView.separated(
      itemCount: list?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5.w),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 5).w,
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${list?[index]['locationName']}'),
                SizedBox(height: 10.w),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _timeWidget(list?[index]['element'] as List<Map<String, dynamic>>),
                  ),
                )
              ],
            ));
      },
    );
  }

  List<Widget> _timeWidget(List<Map<String, dynamic>> map) {
    List<Widget> wid = [];
    for (var element in map) {
      String description = "${element["Wx"]},降雨機率${element["PoP"]}";
      String time = "${element["startTime"]} ~ ${element["endTime"]}";
      String temperature = "氣溫:${element["MinT"]} ~ ${element["MaxT"]}";
      wid.add(Text(time));
      wid.add(Text(description));
      wid.add(Text(temperature));
      wid.add(SizedBox(height: 5.w));
    }
    return wid;
  }
}
