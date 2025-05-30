import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offermath/colors/main_colors.dart';
import 'package:offermath/mainpages/calculator.dart';
import 'package:offermath/mainpages/homepage.dart';
import 'package:offermath/mainpages/profile.dart';

class AllPages extends StatefulWidget {
  final String username;
  final String course;
  const AllPages({super.key, required this.username, required this.course});

  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final List pages = [
      Calculator(),
      Homepage(),
      Profile(username: widget.username, course: widget.course),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: MainColors.mainOrrange,
        color: MainColors.mainDeepPurple,
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(
            Icons.calculate,
            color: currentIndex == 0 ? Colors.black : Colors.white,
          ),
          Icon(
            CupertinoIcons.book,
            color: currentIndex == 1 ? Colors.black : Colors.white,
          ),
          Icon(
            CupertinoIcons.person,
            color: currentIndex == 2 ? Colors.black : Colors.white,
          ),
        ],
      ),
    );
  }
}
