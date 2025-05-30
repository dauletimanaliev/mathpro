import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/auth/loading_page.dart';
import 'package:offermath/firebase_api.dart';
import 'package:offermath/firebase_options.dart';
import 'package:offermath/pages/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final courseName = prefs.getString('course_name');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseApi().initNotifications;

  runApp(MyApp(courseName: courseName));
}

class MyApp extends StatelessWidget {
  final String? courseName;
  const MyApp({super.key, required this.courseName});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(490, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Baloo2',
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          home: courseName == null
              ? LoadingPage(
                  username: '',
                  course: '',
                )
              : Mainpage(),
        );
      },
    );
  }
}
