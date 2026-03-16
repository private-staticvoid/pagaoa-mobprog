import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/detail_screen.dart';

class CustomInfo extends StatelessWidget {
  const CustomInfo({
    super.key,
    required this.name,
    required this.post,
    required this.description,
    required this.date,
    required this.numOfLikes,
    this.profileImagePath,
    this.imageUrl,
  });

  final String name;
  final String post;
  final String description;
  final String date;
  final int numOfLikes;
  final String? profileImagePath;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(
              userName: name,
              postContent: description,
              date: date,
              numOfLikes: numOfLikes,
              imageUrl: imageUrl,
              profileImageUrl: profileImagePath,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setSp(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: ScreenUtil().setSp(25),
              backgroundColor: Colors.grey[300],
              backgroundImage: profileImagePath != null
                  ? AssetImage(profileImagePath!)
                  : null,
              child: profileImagePath == null
                  ? Icon(
                      Icons.person,
                      size: ScreenUtil().setSp(25),
                      color: Colors.white,
                    )
                  : null,
            ),
            SizedBox(width: ScreenUtil().setWidth(10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Posted: $post',
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    date,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}
