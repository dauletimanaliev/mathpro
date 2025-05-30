import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:offermath/models/video.dart';
import 'package:offermath/texts/main_page.dart';
import 'package:offermath/mainpages/video_player_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final videos = <Video>[
    Video(
      title: "Explaining Ellipse",
      videoUrl: "https://youtu.be/Dd6QnH2rMKI",
      thumbnail: "https://img.youtube.com/vi/Dd6QnH2rMKI/0.jpg",
    ),
    Video(
      title: "Explaining Ellipse",
      videoUrl: "https://youtu.be/Dd6QnH2rMKI",
      thumbnail: "https://img.youtube.com/vi/Dd6QnH2rMKI/0.jpg",
    ),
    Video(
      title: "24 ЧАСА В МАГАЗИНЕ ЭЛЕКТРОНИКИ ЧЕЛЛЕНДЖ !",
      videoUrl: "https://www.youtube.com/watch?v=cD1q9oXivBU",
      thumbnail: "https://img.youtube.com/vi/cD1q9oXivBU/0.jpg",
    ),
    Video(
      title: "24 ЧАСА В МАГАЗИНЕ ЭЛЕКТРОНИКИ ЧЕЛЛЕНДЖ !",
      videoUrl: "https://www.youtube.com/watch?v=cD1q9oXivBU",
      thumbnail: "https://img.youtube.com/vi/Dd6QnH2rMKI/0.jpg",
    ),
    Video(
      title: "Explaining Ellipse",
      videoUrl: "https://youtu.be/Dd6QnH2rMKI",
      thumbnail: "https://img.youtube.com/vi/Dd6QnH2rMKI/0.jpg",
    )
  ];

  late List<Video> filteredVideos;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredVideos = List.from(videos);
    searchController.addListener(_filterVideos);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterVideos);
    searchController.dispose();
    super.dispose();
  }

  void _filterVideos() {
    final query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredVideos = List.from(videos);
      } else {
        filteredVideos = videos.where((video) {
          final title = video.title.toLowerCase();
          return title.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                SizedBox(height: 50.h),
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
                            controller: searchController,
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
                ),
              ],
            ),
          ),
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
          CustomList(filteredVideos: filteredVideos),
          Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Most popular',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27.sp,
                ),
              ),
            ),
          ),
          CustomList(filteredVideos: filteredVideos),
          Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Interesting',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27.sp,
                ),
              ),
            ),
          ),
          CustomList(filteredVideos: filteredVideos),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}

class CustomList extends StatelessWidget {
  const CustomList({
    super.key,
    required this.filteredVideos,
  });

  final List<Video> filteredVideos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filteredVideos.length,
        itemBuilder: (context, index) {
          final video = filteredVideos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerPage(
                    videoUrl: video.videoUrl,
                    videoTitle: video.title,
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
                      video.thumbnail,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    height: 60.h,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.sp,
                    top: 10.sp,
                    right: 10.sp,
                    child: Text(
                      video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 190.sp,
                    bottom: 0,
                    left: 215.sp,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 5.sp, left: 30.sp),
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
    );
  }
}
