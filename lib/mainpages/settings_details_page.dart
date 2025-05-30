import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsDetailPage extends StatelessWidget {
  final String title;
  final Widget? body;

  const SettingsDetailPage({
    super.key,
    required this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10.sp),
          child: BackButton(
            style: ButtonStyle(iconSize: WidgetStatePropertyAll(35)),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 15.sp),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30.sp,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: body,
      ),
    );
  }
}
