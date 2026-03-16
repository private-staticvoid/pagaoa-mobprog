import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/post_card.dart';
import '../constants.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ads = _adPosts();

    return Scaffold(
      backgroundColor: FB_LIGHT_PRIMARY,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        children: [
          PostCard(
            userName: 'Achiles',
            profileImagePath: 'assets/images/aki.jpg',
            currentUserProfileImagePath: 'assets/images/aki.jpg',
            postContent: "Hirono for sale",
            numOfLikes: 200,
            hasImage: true,
            date: DateTime.now(),
            postImagePath: 'assets/images/hirono.jpg',
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 275.h,
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
            ),
            items: ads.map(_adWrapper).toList(),
          ),
          PostCard(
            userName: 'Cam',
            profileImagePath: 'assets/images/camprofile.png',
            currentUserProfileImagePath: 'assets/images/aki.jpg',
            postContent: "Just adopted a new family! 🐶",
            numOfLikes: 120,
            hasImage: true,
            date: DateTime(2024, 11, 5),
            postImagePath: 'assets/images/camdog.png',
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 275.h,
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
            ),
            items: ads.map(_adWrapper).toList(),
          ),
          PostCard(
            userName: 'Achiles',
            profileImagePath: 'assets/images/aki.jpg',
            currentUserProfileImagePath: 'assets/images/aki.jpg',
            postContent: "may pasok ba bukas?",
            numOfLikes: 20,
            hasImage: false,
            date: DateTime(2024, 12, 15),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 275.h,
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
            ),
            items: ads.map(_adWrapper).toList(),
          ),
          PostCard(
            userName: 'Achiles',
            profileImagePath: 'assets/images/aki.jpg',
            currentUserProfileImagePath: 'assets/images/aki.jpg',
            postContent: "kelan ba labasan T-T",
            numOfLikes: 120,
            hasImage: false,
            date: DateTime(2024, 12, 14),
          ),
          PostCard(
            userName: 'Achiles',
            profileImagePath: 'assets/images/aki.jpg',
            currentUserProfileImagePath: 'assets/images/aki.jpg',
            postContent: "Utot Pinasok sa ref tumigas!",
            numOfLikes: 120,
            hasImage: false,
            date: DateTime(2024, 12, 12),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 275.h,
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
            ),
            items: ads.map(_adWrapper).toList(),
          ),
          PostCard(
            userName: 'Rhodney Mabaho',
            profileImagePath: 'assets/images/rhodney.png',
            currentUserProfileImagePath: 'assets/images/aki.jpg',
            postContent: "sino nag titinda ng cookies",
            numOfLikes: 120,
            hasImage: true,
            date: DateTime(2024, 12, 5),
            postImagePath: 'assets/images/rhodney.png',
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "Advertisement / Promotion",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.h),
          CarouselSlider(
            options: CarouselOptions(
              height: 275.h,
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
            ),
            items: ads.map(_adWrapper).toList(),
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> _adPosts() {
    return [
      {
        'adsMarket': 'WolfGanger',
        'postContent': 'book your dinner  reservation now!',
        'image':
            'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=1600',
        'profileImage': 'https://i.pravatar.cc/50?img=32',
      },
      {
        'adsMarket': 'NASA',
        'postContent': 'Alien Life Found on Mars!',
        'image':
            'https://images.pexels.com/photos/256381/pexels-photo-256381.jpeg?auto=compress&cs=tinysrgb&w=1600',
        'profileImage': 'https://i.pravatar.cc/50?img=33',
      },
      {
        'adsMarket': 'klook',
        'postContent': 'Book your next adventure with Klook!',
        'image':
            'https://images.pexels.com/photos/210186/pexels-photo-210186.jpeg?auto=compress&cs=tinysrgb&w=1600',
        'profileImage': 'https://i.pravatar.cc/50?img=34',
      },
      {
        'adsMarket': 'Fligts.com',
        'postContent': 'Dreamy Locations Await You!',
        'image':
            'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&cs=tinysrgb&w=1600',
        'profileImage': 'https://i.pravatar.cc/50?img=35',
      },
      {
        'adsMarket': 'Threads',
        'postContent': 'Join the conversation on Threads!',
        'image':
            'https://static.newmobilelife.com/wp-content/uploads/2023/07/threads.jpg',
        'profileImage':
            'https://imgs.hipertextual.com/wp-content/uploads/2023/07/Threads.jpg',
      },
      {
        'profileImage':
            'https://storage.googleapis.com/pr-newsroom-wp/1/2023/12/Generic-FTR-headers_V10-1920x733.jpg',
        'sponsorName': 'Spotify',
        'postContent': 'Listen to Flow G!',
        'imageUrl':
            'https://seeded-session-images.scdn.co/v2/img/122/secondary/artist/3PDFGpPl4ienSn5Vwisfrh/en',
        'cta': 'Listen Now',
      },
      {
        'adsMarket': 'FitRec',
        'postContent': 'Upgrade your fitness routine now!',
        'image':
            'https://dailyfreepress.com/wp-content/uploads/Digital_Coester_FitRecOverCrowded-4.jpg',
        'profileImage': 'https://i.pravatar.cc/50?img=12',
      },
    ];
  }

  Widget _adWrapper(Map<String, String> ad) {
    return AspectRatio(
      aspectRatio: 9 / 11,
      child: PostCard(
        userName: 'Sponsored',
        postContent: ad['postContent'] ?? '',
        date: 'Sponsored',
        isAds: true,
        adsMarket: ad['adsMarket'] ?? '',
        postImagePath: ad['image'],
        profileImagePath: ad['profileImage'],
        currentUserProfileImagePath: '',
      ),
    );
  }
}
