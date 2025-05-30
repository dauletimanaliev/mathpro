import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/colors/main_colors.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? page;
  final String nameButton;
  const CustomButton({super.key, this.page, required this.nameButton});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: MainColors.mainOrrange,
              blurRadius: 8,
              offset: Offset(
                0,
                5,
              ),
            ),
          ],
        ),
        width: 314.w,
        height: 45.h,
        child: ElevatedButton(
          onPressed: widget.page,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              backgroundColor: MainColors.mainOrrange,
              foregroundColor: Colors.white),
          child: Text(
            widget.nameButton,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
