import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPostScreen extends StatelessWidget {
  final String postUrl =
      "https://example.com/video-post"; // Replace with your URL logic

  void _sharePost(BuildContext context) {
    final Uri postUri = Uri.parse(postUrl);
    _launchUrl(postUri);
  }

  void _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is a Video Post',
            style: TextStyle(fontSize: 24.sp),
          ),
          SizedBox(height: 20.h),
          ElevatedButton.icon(
            onPressed: (){},
            // => _sharePost(context),
            icon: Icon(Icons.share),
            label: Text('Share'),
          ),
        ],
      ),
    );
  }
}
