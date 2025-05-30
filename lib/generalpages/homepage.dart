import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offermath/texts/main_page.dart';
import 'package:offermath/pages/video_player_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, String>> videos = [
    {
      "title": "Explaining Ellipse",
      "videoUrl": "https://youtu.be/Dd6QnH2rMKI",
      "thumbnail": "https://img.youtube.com/vi/Dd6QnH2rMKI/0.jpg"
    },
    {
      "title": "Explaining Circle",
      "videoUrl": "https://youtu.be/EQC_tb4TB00",
      "thumbnail": "https://img.youtube.com/vi/EQC_tb4TB00/0.jpg"
    },
    {
      "title": "Explaining Circle",
      "videoUrl": "https://youtu.be/EQC_tb4TB00",
      "thumbnail": "https://img.youtube.com/vi/EQC_tb4TB00/0.jpg"
    },
    {
      "title": "Explaining Ellipse",
      "videoUrl": "https://youtu.be/Dd6QnH2rMKI",
      "thumbnail": "https://img.youtube.com/vi/Dd6QnH2rMKI/0.jpg"
    },
    {
      "title": "Explaining Circle",
      "videoUrl": "https://youtu.be/EQC_tb4TB00",
      "thumbnail": "https://img.youtube.com/vi/EQC_tb4TB00/0.jpg"
    },
    {
      "title": "Explaining Circle",
      "videoUrl": "https://youtu.be/EQC_tb4TB00",
      "thumbnail": "https://img.youtube.com/vi/EQC_tb4TB00/0.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 360.h,
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF652AB2), Color(0xFF2B124C)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.sp),
                bottomRight: Radius.circular(20.sp),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25.r,
                      child: Text(
                        '[pfp]',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: SizedBox(
                          height: 37.h,
                          child: TextFormField(
                            cursorHeight: 15.h,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              hintText: MainPageText.homePageHintText,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton.filledTonal(
                          color: Colors.white,
                          icon: Icon(Icons.notifications,
                              color: Colors.black, size: 30.sp),
                          onPressed: () {},
                        ),
                        IconButton.filledTonal(
                          color: Colors.white,
                          icon: Icon(Icons.message,
                              color: Colors.black, size: 27.sp),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 65.h),
                Text(
                  MainPageText.homePageTitleText,
                  style: TextStyle(
                    fontSize: 60.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  MainPageText.homePageSubtitleText,
                  style: TextStyle(fontSize: 20.sp),
                )
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    MainPageText.homePageTopic,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 140.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerPage(
                              videoUrl: video["videoUrl"]!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20.sp),
                        width: 400.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                video["thumbnail"]!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              top: 190.sp,
                              bottom: 0,
                              left: 215.sp,
                              right: 0,
                              child: Container(
                                padding:
                                    EdgeInsets.only(top: 5.sp, left: 30.sp),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.r),
                                    topRight: Radius.circular(0),
                                    bottomRight: Radius.circular(10.r),
                                  ),
                                ),
                                child: Text(
                                  '14 lessons   6hr 36min',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 140.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerPage(
                              videoUrl: video["videoUrl"]!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20.sp),
                        width: 400.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                video["thumbnail"]!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              top: 190.sp,
                              bottom: 0,
                              left: 215.sp,
                              right: 0,
                              child: Container(
                                padding:
                                    EdgeInsets.only(top: 5.sp, left: 30.sp),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.r),
                                    topRight: Radius.circular(0),
                                    bottomRight: Radius.circular(10.r),
                                  ),
                                ),
                                child: Text(
                                  '14 lessons   6hr 36min',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 140.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerPage(
                              videoUrl: video["videoUrl"]!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20.sp),
                        width: 400.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                video["thumbnail"]!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              top: 190.sp,
                              bottom: 0,
                              left: 215.sp,
                              right: 0,
                              child: Container(
                                padding:
                                    EdgeInsets.only(top: 5.sp, left: 30.sp),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.r),
                                    topRight: Radius.circular(0),
                                    bottomRight: Radius.circular(10.r),
                                  ),
                                ),
                                child: Text(
                                  '14 lessons   6hr 36min',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
