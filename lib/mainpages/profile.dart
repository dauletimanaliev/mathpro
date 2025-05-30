import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:offermath/mainpages/leaderboard.dart';
import 'package:offermath/mainpages/settings.dart';
import 'package:offermath/texts/main_page.dart';

class Profile extends StatefulWidget {
  final String username;
  final String course;
  const Profile({super.key, required this.username, required this.course});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;
  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
                icon: Icon(size: 45.sp, Icons.settings),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.sp),
            child: Row(
              children: [
                image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50.sp),
                        child: CircleAvatar(
                          radius: 50.r,
                          child: Image.file(
                            image!,
                            width: 120.w,
                            height: 120.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : FlutterLogo(size: 65.sp),
                SizedBox(width: 50.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username.isNotEmpty ? widget.username : 'Аты жоқ',
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
          Padding(
            padding: EdgeInsets.only(left: 30.sp),
            child: GestureDetector(
              onTap: () => pickImage(),
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
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [GrayContainer(), GrayContainer()],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [GrayContainer(), GrayContainer()],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => LeaderboardPage()));
              },
              child: Text('data'))
        ],
      ),
    );
  }
}

class GrayContainer extends StatelessWidget {
  const GrayContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 74.h,
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
