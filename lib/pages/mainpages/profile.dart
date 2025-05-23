import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/texts/main_page.dart';

class Profile extends StatefulWidget {
  final String username;
  final String course;
  const Profile({super.key, required this.username, required this.course});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(size: 45.sp, Icons.settings),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.sp),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/aboy.jpg'),
                  radius: 80.r,
                ),
                SizedBox(width: 30.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 32.sp),
                    ),
                    Text(
                      widget.course,
                      style: TextStyle(color: Colors.black, fontSize: 32.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: 30.sp),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.plus_circled,
                    color: const Color.fromARGB(255, 145, 145, 145),
                    size: 25.sp,
                  ),
                  SizedBox(width: 5.w),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      MainPageText.editText,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 145, 145, 145),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
