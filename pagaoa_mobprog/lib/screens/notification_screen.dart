import '../widgets/custom_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart'; // for color palette

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FB_LIGHT_PRIMARY,
      body: ListView(
        padding: EdgeInsets.all(10.w),
        children: [
          CustomInfo(
            name: 'Cam',
            post: 'Updated profile picture',
            description: 'Cam just refreshed their look!',
            profileImagePath: 'assets/images/camprofile.png',
            date: 'Jan 3, 2026',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
          CustomInfo(
            name: 'Cam',
            post: 'Posted a new photo',
            description: 'Check out Cam’s new post!',
            profileImagePath: 'assets/images/camdog.png',
            date: 'Jan 2, 2026',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
          CustomInfo(
            name: 'Achiles',
            post: 'Posted in Hirono Buy & Sell',
            description: 'Selling a rare Hirono item!',
            profileImagePath: 'assets/images/aki.jpg',
            date: 'Dec 30, 2025',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
          CustomInfo(
            name: 'Achiles',
            post: 'Updated his cover Photo',
            description: 'Adventure Time',
            profileImagePath: 'assets/images/aki.jpg',
            date: 'Dec 28, 2025',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
          CustomInfo(
            name: 'Achiles',
            post: 'Posted a new status',
            description: 'Kelan ba labasan T-T',
            profileImagePath: 'assets/images/aki.jpg',
            date: 'Dec 25, 2025',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
          CustomInfo(
            name: 'Rhodney Mabaho',
            post: 'Updated his profile photo',
            description: 'Bat ang baho ko?',
            profileImagePath: 'assets/images/rhodney.png',
            date: 'Dec 20, 2025',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
          CustomInfo(
            name: 'Rhodney Mabaho',
            post: 'Posted in Bullgagi',
            description: 'Sino nag titinda ng cookies?',
            profileImagePath: 'assets/images/rhodney.png',
            date: 'Dec 18, 2025',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
          CustomInfo(
            name: 'Achiles',
            post: 'Posted a new status!',
            description: 'Utot pinasok sa ref Tumigas',
            profileImagePath: 'assets/images/aki.jpg',
            date: 'Dec 15, 2025',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
          CustomInfo(
            name: 'Achiles',
            post: 'Posted in Bullgagi',
            description: 'May pasok ba bukas?',
            profileImagePath: 'assets/images/aki.jpg',
            date: 'Dec 12, 2025',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
          CustomInfo(
            name: 'Marahuyo',
            post: 'Successfully created your account',
            description: '',
            profileImagePath: 'assets/images/marahuyo.png',
            date: 'Dec 10, 2025',
            numOfLikes: 0,
          ),
          Divider(color: FB_SECONDARY),
        ],
      ),
    );
  }
}
