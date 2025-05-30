import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormfield extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  // ignore: prefer_typing_uninitialized_variables
  final validator;

  const CustomFormfield({
    super.key,
    this.controller,
    this.validator,
  });

  @override
  State<CustomFormfield> createState() => _CustomFormfieldState();
}

class _CustomFormfieldState extends State<CustomFormfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.sp),
      child: SizedBox(
        height: 50.h,
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          cursorHeight: 17.h,
          decoration: InputDecoration(
            fillColor: Color(0xff7447AD),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            helperStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
