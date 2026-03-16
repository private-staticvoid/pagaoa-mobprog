import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_font.dart';
import '../widgets/custom_button.dart';
import '../widgets/post_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> userPosts = [
    {
      'userName': 'Achiles',
      'profileImagePath': 'assets/images/aki.jpg',
      'postContent': 'Hirono for sale',
      'numOfLikes': 200,
      'date': DateTime.now(),
      'hasImage': true,
      'postImagePath': 'assets/images/hirono.jpg',
    },
    {
      'userName': 'Achiles',
      'profileImagePath': 'assets/images/aki.jpg',
      'postContent': 'may pasok ba bukas?',
      'numOfLikes': 20,
      'date': DateTime(2025, 12, 15),
      'hasImage': false,
    },
    {
      'userName': 'Achiles',
      'profileImagePath': 'assets/images/aki.jpg',
      'postContent': 'kelan ba labasan T-T',
      'numOfLikes': 136,
      'date': DateTime(2025, 12, 14),
      'hasImage': false,
    },
    {
      'userName': 'Achiles',
      'profileImagePath': 'assets/images/aki.jpg',
      'postContent': 'utot pinasok sa ref tumigas',
      'numOfLikes': 231,
      'date': DateTime(2025, 12, 12),
      'hasImage': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: FB_LIGHT_PRIMARY,
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWKsXzMI61yYKgsDRbpYgknHdxBlEa7bAoCw&s',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 20.w,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://todaystage.com/wp-content/uploads/2025/01/Kim-Min-Gyu-683x1024.jpg',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: FB_SECONDARY,
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 55.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    text: 'Achiles',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: FB_TEXT_COLOR_WHITE,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      CustomFont(
                        text: '752',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: FB_TEXT_COLOR_WHITE,
                      ),
                      SizedBox(width: 5.w),
                      CustomFont(
                        text: 'followers',
                        fontSize: 15.sp,
                        color: FB_SECONDARY,
                      ),
                      SizedBox(width: 10.w),
                      CustomFont(
                        text: '220',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: FB_TEXT_COLOR_WHITE,
                      ),
                      SizedBox(width: 5.w),
                      CustomFont(
                        text: 'following',
                        fontSize: 15.sp,
                        color: FB_SECONDARY,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      CustomButton(
                        buttonName: 'Follow',
                        onPressed: () {},
                        buttonType: 'elevated',
                        fontColor: FB_TEXT_COLOR_WHITE,
                        outlineColor: FB_DARK_PRIMARY,
                      ),
                      SizedBox(width: 10.w),
                      CustomButton(
                        buttonName: 'Message',
                        onPressed: () {},
                        buttonType: 'outlined',
                        fontColor: FB_DARK_PRIMARY,
                        outlineColor: FB_DARK_PRIMARY,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            /// Tabs
            TabBar(
              indicatorColor: FB_DARK_PRIMARY,
              tabs: const [
                Tab(text: 'Posts'),
                Tab(text: 'About'),
                Tab(text: 'Photos'),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.all(10.w),
                    itemCount: userPosts.length,
                    itemBuilder: (context, index) {
                      final post = userPosts[index];
                      return PostCard(
                        userName: post['userName'] as String,
                        profileImagePath: post['profileImagePath'] as String?,
                        currentUserProfileImagePath:
                            post['profileImagePath'] as String?,
                        postContent: post['postContent'] as String,
                        numOfLikes: post['numOfLikes'] as int,
                        date: post['date'],
                        hasImage: post['hasImage'] as bool? ?? false,
                        postImagePath: post['postImagePath'] as String?,
                      );
                    },
                  ),

                  ListView(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                    children: [
                      CustomFont(
                        text: "Contact Info",
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.bold,
                        color: FB_DARK_PRIMARY,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.phone,
                          color: FB_DARK_PRIMARY,
                        ),
                        title: CustomFont(
                          text: "09618 8919 908",
                          fontSize: ScreenUtil().setSp(15),
                          color: FB_TEXT_COLOR_WHITE,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.email,
                          color: FB_DARK_PRIMARY,
                        ),
                        title: CustomFont(
                          text: "achiles troy pagaoa@gmail.com",
                          fontSize: ScreenUtil().setSp(15),
                          color: FB_TEXT_COLOR_WHITE,
                        ),
                      ),
                      Divider(color: FB_SECONDARY),

                      CustomFont(
                        text: "Work",
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.bold,
                        color: FB_DARK_PRIMARY,
                      ),
                      ListTile(
                        leading: const Icon(Icons.work, color: FB_DARK_PRIMARY),
                        title: CustomFont(
                          text: "krustycran",
                          fontSize: ScreenUtil().setSp(15),
                          color: FB_TEXT_COLOR_WHITE,
                        ),
                      ),
                      Divider(color: FB_SECONDARY),

                      CustomFont(
                        text: "Basic Info",
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.bold,
                        color: FB_DARK_PRIMARY,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: FB_DARK_PRIMARY,
                        ),
                        title: CustomFont(
                          text: "Male",
                          fontSize: ScreenUtil().setSp(15),
                          color: FB_TEXT_COLOR_WHITE,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.cake, color: FB_DARK_PRIMARY),
                        title: CustomFont(
                          text: "July 4, 2005",
                          fontSize: ScreenUtil().setSp(15),
                          color: FB_TEXT_COLOR_WHITE,
                        ),
                      ),
                      Divider(color: FB_SECONDARY),

                      CustomFont(
                        text: "Relationship",
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.bold,
                        color: FB_DARK_PRIMARY,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.favorite,
                          color: FB_DARK_PRIMARY,
                        ),
                        title: CustomFont(
                          text: "Single",
                          fontSize: ScreenUtil().setSp(15),
                          color: FB_TEXT_COLOR_WHITE,
                        ),
                      ),
                    ],
                  ),

                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: ScreenUtil().setWidth(10),
                    mainAxisSpacing: ScreenUtil().setHeight(10),
                    padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/aki.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/akicover.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
