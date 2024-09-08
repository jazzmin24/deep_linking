// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:share_plus/share_plus.dart';

// class VideoPostScreen extends StatelessWidget {
//   void _shareUrl() {
//     final url = 'https://flutter.dev';
//     Share.share(url);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(git
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'This is a Video Post',
//             style: TextStyle(fontSize: 24.sp),
//           ),
//           SizedBox(height: 20.h),
//           ElevatedButton.icon(
//             onPressed: _shareUrl,
//             icon: Icon(Icons.share),
//             label: Text('Share'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoPostScreen extends StatefulWidget {
  @override
  _VideoPostScreenState createState() => _VideoPostScreenState();
}

class _VideoPostScreenState extends State<VideoPostScreen> {
  void _shareUrl() {
    final url = 'https://deep-linking.pages.dev';
    Share.share(url);
  }

  late VideoPlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/video/video.mp4', // Path to your video asset
    )..initialize().then((_) {
        setState(() {
          _isPlayerReady = true;
        });
      }).catchError((error) {
        print('Error initializing video player: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300.h,
            width: double.infinity,
            child: Center(
              child: _isPlayerReady
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : CircularProgressIndicator(),
            ),
          ),
          SizedBox(height: 18.h),
          ElevatedButton.icon(
            onPressed: _shareUrl,
            icon: Icon(Icons.share),
            label: Text('Share'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
