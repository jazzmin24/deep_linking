import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ImagePostScreen extends StatelessWidget {
  void _shareUrl() {
    final url = 'https://deep-linking.pages.dev';
    Share.share(url);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image/image.png'),
          SizedBox(height: 20.h),
          ElevatedButton.icon(
            onPressed: _shareUrl,
            icon: Icon(Icons.share),
            label: Text('Share'),
          ),
        ],
      ),
    );
  }
}
