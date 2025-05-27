import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/background/main_background.dart';
import 'package:offermath/custom_widgets/custom_button.dart';
import 'package:offermath/custom_widgets/custom_formfield.dart';
import 'package:offermath/auth/loading_page.dart';
import 'package:offermath/texts/main_page.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final globalKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController course = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: MainBackground(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  MainPageText.authentication,
                  style: TextStyle(
                    fontSize: 38.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.sp,
                  ),
                  child: Container(
                    height: 42.h,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.sp)),
                    child: TabBar(
                      indicatorPadding: EdgeInsets.symmetric(
                        horizontal: 5.sp,
                        vertical: 5.sp,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Color(0xff7447AD),
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      labelColor: Colors.white,
                      labelStyle: TextStyle(fontSize: 24.sp),
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Tab(
                          text: MainPageText.studentChoice,
                        ),
                        Tab(
                          text: MainPageText.teacherChoice,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Form(
                          key: globalKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20.0.sp),
                                child: Text(
                                  MainPageText.studentUsername,
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                              // ! STUDENT'S FIRST TEXTFORMFIELD
                              CustomFormfield(
                                controller: username,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.sp),
                                child: Text(
                                  "For example: Daulet Imanaliev",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white70),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0.sp),
                                child: Text(
                                  MainPageText.studentCourse,
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                              // ! STUDENT'S SECOND TEXTFORMFIELD
                              CustomFormfield(
                                controller: course,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.sp),
                                child: Text(
                                  "For example: 2F-3",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white70),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0.sp),
                                child: Text(
                                  MainPageText.teacher,
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                              // ! STUDENT'S THIRD TEXTFORMFIELD
                              CustomFormfield(),
                              Padding(
                                padding: EdgeInsets.all(20.0.sp),
                                child: Text(
                                  MainPageText.individualCodeStudent,
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                              // ! STUDENT'S FORTH TEXTFORMFIELD
                              CustomFormfield(),
                              SizedBox(
                                height: 60.h,
                              ),
                              // BUTTONNNNNNNNNNNNNNNNNNNNNNN
                              CustomButton(
                                page: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoadingPage(
                                        username: username.text,
                                        course: course.text,
                                      ),
                                    ),
                                  );
                                },
                                nameButton: MainPageText.authButton,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ! NEXT TABBAR

                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20.0.sp),
                              child: Text(
                                MainPageText.teacherName,
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                            //? TEACHER'S FIRST TEXTFORMFIELD
                            CustomFormfield(),
                            Padding(
                              padding: EdgeInsets.all(20.0.sp),
                              child: Text(
                                MainPageText.subject,
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),

                            //? TEACHER'S THIRD TEXTFORMFIELD
                            CustomFormfield(),
                            Padding(
                              padding: EdgeInsets.all(20.0.sp),
                              child: Text(
                                MainPageText.individualCodeTeacher,
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),

                            // ! THIRD TEXTFORMFIELD
                            CustomFormfield(),
                            SizedBox(
                              height: 145.h,
                            ),
                            // BUTTONNNNNNNNNNNNNNNNNNNN
                            CustomButton(
                              page: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoadingPage(
                                      username: username.text,
                                      course: course.text,
                                    ),
                                  ),
                                );
                              },
                              nameButton: MainPageText.authButton,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
