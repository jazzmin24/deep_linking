import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class TextPostScreen extends StatelessWidget {
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'The greatest glory in living lies not in never falling, but in rising every time we fall.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
            ),
          ),
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
