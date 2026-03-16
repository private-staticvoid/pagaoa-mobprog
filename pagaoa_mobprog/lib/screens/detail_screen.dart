import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_font.dart';
import '../constants.dart';

class DetailScreen extends StatefulWidget {
  // POST OWNER
  final String userName;
  final String? profileImageUrl;

  // POST CONTENT
  final String postContent;
  final String date;
  final int numOfLikes;
  final String? imageUrl;

  // CURRENT USER (COMMENTER)
  final String? currentUserProfileImagePath;

  const DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.imageUrl,
    this.profileImageUrl,
    this.currentUserProfileImagePath,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool isLiked;
  late int likesCount;

  @override
  void initState() {
    super.initState();
    isLiked = false;
    likesCount = widget.numOfLikes;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likesCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FB_LIGHT_PRIMARY,
      appBar: AppBar(title: const Text('Post'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User info row
              Row(
                children: [
                  CircleAvatar(
                    radius: ScreenUtil().setSp(18),
                    backgroundColor: Colors.grey[300],
                    backgroundImage: widget.profileImageUrl != null
                        ? AssetImage(widget.profileImageUrl!)
                        : null,
                    child: widget.profileImageUrl == null
                        ? Icon(
                            Icons.person,
                            size: ScreenUtil().setSp(18),
                            color: Colors.white,
                          )
                        : null,
                  ),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        text: widget.userName,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          CustomFont(
                            text: widget.date,
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.grey,
                          ),
                          SizedBox(width: ScreenUtil().setWidth(3)),
                          Icon(
                            Icons.public,
                            color: Color.fromARGB(255, 135, 153, 182),
                            size: ScreenUtil().setSp(15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz),
                ],
              ),

              SizedBox(height: ScreenUtil().setHeight(5)),

              // Post content
              CustomFont(
                text: widget.postContent,
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black,
              ),

              SizedBox(height: ScreenUtil().setHeight(5)),

              // Post image
              if (widget.imageUrl != null)
                Container(
                  color: Color.fromARGB(255, 188, 213, 227),
                  child: Image.asset(widget.imageUrl!, fit: BoxFit.cover),
                ),

              SizedBox(height: ScreenUtil().setHeight(10)),

              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: toggleLike,
                    child: Row(
                      children: [
                        Icon(
                          isLiked ? Icons.star : Icons.star_border,
                          color: Color.fromARGB(255, 169, 154, 18),
                          size: 18.sp,
                        ),
                        SizedBox(width: 4.w),
                        CustomFont(
                          text: likesCount.toString(),
                          fontSize: 12.sp,
                          color: Color.fromARGB(255, 169, 154, 18),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Comment tapped!');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.comment_outlined, size: 18.sp),
                        SizedBox(width: 4.w),
                        CustomFont(
                          text: 'Comment',
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Share tapped!');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.share_outlined, size: 18.sp),
                        SizedBox(width: 4.w),
                        CustomFont(
                          text: 'Share',
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: ScreenUtil().setHeight(10)),

              // Comment input
              Row(
                children: [
                  CircleAvatar(
                    radius: ScreenUtil().setSp(15),
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        (widget.currentUserProfileImagePath != null &&
                            widget.currentUserProfileImagePath!.isNotEmpty)
                        ? AssetImage(widget.currentUserProfileImagePath!)
                        : null,
                    child:
                        (widget.currentUserProfileImagePath == null ||
                            widget.currentUserProfileImagePath!.isEmpty)
                        ? Icon(
                            Icons.person,
                            size: ScreenUtil().setSp(15),
                            color: Colors.white,
                          )
                        : null,
                  ),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(10),
                      ),
                      height: ScreenUtil().setHeight(25),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setSp(10),
                        ),
                      ),
                      child: CustomFont(
                        text: 'Write a comment...',
                        fontSize: ScreenUtil().setSp(11),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: ScreenUtil().setHeight(10)),

              CustomFont(
                text: 'View Comments',
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
