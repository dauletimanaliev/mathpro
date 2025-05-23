import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/background/main_background.dart';
import 'package:offermath/colors/main_colors.dart';
import 'package:offermath/pages/all_pages.dart';
import 'package:offermath/texts/main_page.dart';

class LoadingPage extends StatefulWidget {
  final String username;
  final String course;
  const LoadingPage({
    super.key,
    required this.username,
    required this.course,
  });

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double _value = 0;
  final double _maxValue = 100;

  @override
  void initState() {
    super.initState();

    _startSliderProgress();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
              builder: (context) => AllPages(
                    username: widget.username,
                    course: widget.course,
                  )));
    });
  }

  void _startSliderProgress() async {
    int steps = 50; // count of steps
    int duration = 5000 ~/ steps; // time between steps

    for (int i = 1; i <= steps; i++) {
      await Future.delayed(Duration(milliseconds: duration));
      setState(() {
        _value = (_maxValue / steps) * i; // increasing value
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 250.h,
              ),
              Text(
                MainPageText.equation,
                style: TextStyle(
                  fontSize: 35.sp,
                  color: const Color.fromARGB(212, 255, 255, 255),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Text(
                MainPageText.waitForLoading,
                style: TextStyle(
                  color: const Color.fromARGB(203, 255, 255, 255),
                  fontSize: 25.sp,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: MainColors.mainOrrange,
                  inactiveTrackColor: const Color.fromARGB(108, 255, 255, 255),
                  trackHeight: 7.h,
                  thumbShape: SliderComponentShape.noThumb,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90.sp),
                  child: Slider(
                    min: 0,
                    max: _maxValue,
                    value: _value,
                    onChanged: (double newValue) {
                      setState(() {
                        _value = newValue;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Text(
                MainPageText.textInterestingFact,
                style: TextStyle(
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Text(
                  textAlign: TextAlign.center,
                  MainPageText.interestingFact,
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
