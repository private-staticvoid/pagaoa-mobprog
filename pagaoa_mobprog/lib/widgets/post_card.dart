import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart'; // ✅ added

import 'custom_font.dart';
import '../screens/detail_screen.dart';

class PostCard extends StatefulWidget {
  final String userName;
  final String? profileImagePath;
  final String postContent;
  final dynamic date;
  final int numOfLikes;
  final bool hasImage;
  final String? postImagePath;
  final String currentUserProfileImagePath;
  final bool isAds;
  final String adsMarket;

  const PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.profileImagePath,
    this.postImagePath,
    int? numOfLikes,
    String? currentUserProfileImagePath,
    bool? hasImage,
    bool? isAds,
    String? adsMarket,
  }) : numOfLikes = numOfLikes ?? 0,
       currentUserProfileImagePath = currentUserProfileImagePath ?? '',
       hasImage = hasImage ?? (postImagePath != null),
       isAds = isAds ?? false,
       adsMarket = adsMarket ?? '';

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
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

  String formatDate(dynamic date) {
    if (date is DateTime) {
      return DateFormat('MMMM d, yyyy').format(date);
    }
    return date.toString();
  }

  void openDetailScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          userName: widget.userName,
          postContent: widget.postContent,
          date: formatDate(widget.date),
          numOfLikes: likesCount,
          imageUrl: widget.hasImage ? widget.postImagePath : null,
          profileImageUrl: widget.profileImagePath,
        ),
      ),
    );
  }

  Widget _buildPostImage(String? path) {
    if (path == null) return SizedBox.shrink();
    if (path.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: path,
        fit: BoxFit.cover,
        width: double.infinity,
        placeholder: (_, __) => Center(child: CircularProgressIndicator()),
        errorWidget: (_, __, ___) => Icon(Icons.error, size: 40),
      );
    } else {
      return Image.asset(path, fit: BoxFit.cover, width: double.infinity);
    }
  }

  ImageProvider? _buildAvatar(String? path) {
    if (path == null || path.isEmpty) return null;
    return path.startsWith('http')
        ? CachedNetworkImageProvider(path)
        : AssetImage(path) as ImageProvider;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openDetailScreen,
      child: Card(
        color: const Color.fromARGB(255, 234, 248, 248),
        margin: EdgeInsets.all(10.sp),
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.sp,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _buildAvatar(widget.profileImagePath),
                    child: widget.profileImagePath == null
                        ? Icon(Icons.person, size: 18.sp, color: Colors.white)
                        : null,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        text: widget.userName,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          CustomFont(
                            text: formatDate(widget.date),
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 3.w),
                          Icon(
                            Icons.public,
                            size: 15.sp,
                            color: const Color.fromARGB(255, 135, 153, 182),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz),
                ],
              ),

              SizedBox(height: 5.h),

              CustomFont(
                text: widget.postContent,
                fontSize: 12.sp,
                color: Colors.black,
              ),

              SizedBox(height: 5.h),

              if (widget.hasImage)
                Container(
                  color: const Color.fromARGB(255, 188, 213, 227),
                  child: _buildPostImage(widget.postImagePath),
                ),

              SizedBox(height: 10.h),

              if (!widget.isAds)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: toggleLike,
                      child: Row(
                        children: [
                          Icon(
                            isLiked ? Icons.star : Icons.star_border,
                            color: const Color.fromARGB(255, 169, 154, 18),
                            size: 18.sp,
                          ),
                          SizedBox(width: 4.w),
                          CustomFont(
                            text: likesCount.toString(),
                            fontSize: 12.sp,
                            color: const Color.fromARGB(255, 169, 154, 18),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
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
                      onTap: () {},
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

              if (!widget.isAds) ...[
                SizedBox(height: 10.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: _buildAvatar(
                        widget.currentUserProfileImagePath,
                      ),
                      child: widget.currentUserProfileImagePath.isEmpty
                          ? Icon(Icons.person, size: 15.sp, color: Colors.white)
                          : null,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: CustomFont(
                          text: 'Write a comment...',
                          fontSize: 11.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],

              if (widget.isAds)
                Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFont(
                            text: 'SPONSORED',
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          CustomFont(
                            text: widget.adsMarket,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: openDetailScreen,
                        child: const Text('Learn More'),
                      ),
                    ],
                  ),
                ),

              SizedBox(height: 7.h, width: 20.w),

              if (!widget.isAds)
                CustomFont(
                  text: 'View Comments',
                  fontSize: 12.sp,
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
