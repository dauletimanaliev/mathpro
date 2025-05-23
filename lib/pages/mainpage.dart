import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/background/main_background.dart';
import 'package:offermath/custom_widgets/custom_button.dart';
import 'package:offermath/pages/auth.dart';
import 'package:offermath/texts/main_page.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SafeArea(
          child: Column(
            children: [
              
              SizedBox(
                height: 170.h,
              ),
              FittedBox(
                child: Text(
                  MainPageText.nameApp,
                  style: TextStyle(fontSize: 60.sp),
                ),
              ),
              CustomButton(
                nameButton: MainPageText.getStarted,
                page: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Auth(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
