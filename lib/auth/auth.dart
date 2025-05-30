import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/background/main_background.dart';
import 'package:offermath/custom_widgets/custom_button.dart';
import 'package:offermath/custom_widgets/custom_formfield.dart';
import 'package:offermath/auth/loading_page.dart';
import 'package:offermath/services/firestore_service.dart';
import 'package:offermath/texts/main_page.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final GlobalKey<FormState> studentKey = GlobalKey<FormState>();
  final GlobalKey<FormState> teacherKey = GlobalKey<FormState>();
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController username = TextEditingController();
  final TextEditingController course = TextEditingController();
  final TextEditingController teacher = TextEditingController();
  final TextEditingController indCode = TextEditingController();

  final TextEditingController teacherName = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController teacherIndCode = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name cannot be empty';
    }
    final parts = value.trim().split(' ');
    if (parts.length < 2) {
      return 'Please enter both first and last name';
    }
    final nameRegex = RegExp(r'^[A-Z][a-z]+$');
    for (var part in parts) {
      if (!nameRegex.hasMatch(part)) {
        return 'Each part must start with a capital letter';
      }
    }
    return null;
  }

  String? validateCourse(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Course cannot be empty';
    }
    final courseRegex = RegExp(r'^[1-9][A-Z]-[0-9]$');
    if (!courseRegex.hasMatch(value.trim())) {
      return 'Format must be like 2F-3';
    }
    return null;
  }

  String? validateTeacher(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Teacher cannot be empty';
    }
    if (value.trim().length < 2) {
      return 'Enter a valid teacher name';
    }
    return null;
  }

  String? validateindCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'indCode cannot be empty';
    }
    if (value.trim().length < 4 || value.trim().length > 10) {
      return 'indCode must be 4-10 characters';
    }
    return null;
  }

  String? validateSubject(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Subject cannot be empty';
    }
    if (value.trim().length < 2) {
      return 'Enter a valid subject';
    }
    return null;
  }

  Future<bool> saveUserData() async {
    if (!studentKey.currentState!.validate()) return false;

    try {
      final userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('individualCode', isEqualTo: indCode.text.trim())
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('This individual code is already in use.'),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }

      await FirebaseFirestore.instance.collection('users').add({
        'type': 'student',
        'name': username.text.trim(),
        'course': course.text.trim(),
        'teacher': teacher.text.trim(),
        'individualCode': indCode.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Succesful!'),
          backgroundColor: Colors.green,
        ),
      );

      username.clear();
      course.clear();
      teacher.clear();
      indCode.clear();

      return true;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  Future<bool> saveTeacherData() async {
    if (!teacherKey.currentState!.validate()) return false;

    try {
      await FirebaseFirestore.instance.collection('teachers').add({
        'type': 'teacher',
        'name': teacherName.text.trim(),
        'subject': subject.text.trim(),
        'individualCode': teacherIndCode.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "The teacher's data has been successfully saved in Firebase!"),
          backgroundColor: Colors.green,
        ),
      );

      teacherName.clear();
      subject.clear();
      teacherIndCode.clear();

      return true;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          backgroundColor: Colors.red,
        ),
      );

      return false;
    } finally {
      setState(() {});
    }
  }

  @override
  void dispose() {
    username.dispose();
    course.dispose();
    teacher.dispose();
    indCode.dispose();
    teacherName.dispose();
    subject.dispose();
    teacherIndCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: MainBackground(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 25.h),
                Text(
                  MainPageText.authentication,
                  style: TextStyle(
                    fontSize: 38.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.sp),
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
                SizedBox(height: 5.h),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Form(
                          key: studentKey,
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
                              CustomFormfield(
                                controller: username,
                                validator: validateName,
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
                              CustomFormfield(
                                controller: course,
                                validator: validateCourse,
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
                              CustomFormfield(
                                controller: teacher,
                                validator: validateTeacher,
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0.sp),
                                child: Text(
                                  MainPageText.individualCodeStudent,
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                              CustomFormfield(
                                controller: indCode,
                                validator: validateindCode,
                              ),
                              SizedBox(height: 60.h),
                              CustomButton(
                                page: () async {
                                  final success = await saveUserData();
                                  if (success) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoadingPage(
                                          username: username.text,
                                          course: course.text,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                nameButton: MainPageText.authButton,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Form(
                          key: teacherKey,
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
                              CustomFormfield(
                                controller: teacherName,
                                validator: validateName,
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0.sp),
                                child: Text(
                                  MainPageText.subject,
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                              CustomFormfield(
                                controller: subject,
                                validator: validateSubject,
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0.sp),
                                child: Text(
                                  MainPageText.individualCodeTeacher,
                                  style: TextStyle(fontSize: 20.sp),
                                ),
                              ),
                              CustomFormfield(
                                controller: teacherIndCode,
                                validator: validateindCode,
                              ),
                              SizedBox(height: 60.h),
                              CustomButton(
                                page: () async {
                                  final success = await saveTeacherData();
                                  if (success) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoadingPage(
                                          username: username.text,
                                          course: course.text,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                nameButton: 'Register Teacher',
                              ),
                            ],
                          ),
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
