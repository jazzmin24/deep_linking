import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextPostScreen extends StatelessWidget {
  void _shareUrl() {
    final url = 'https://flutter.dev';
    Share.share(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Post'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _shareUrl,
          child: Text('Share Post'),
        ),
      ),
    );
  }
}
