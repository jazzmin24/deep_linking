import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindlink_assignment/screens/home_screen.dart';
import 'package:mindlink_assignment/screens/text_post_screen.dart';
import 'package:uni_links2/uni_links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      _handleIncomingLinks();
    }
    // _handleIncomingLinks();
  }

  void _handleIncomingLinks() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _navigateToPost(uri);
      }
    }, onError: (err) {
      // Handle error
    });
  }

  void _navigateToPost(Uri uri) {
    // Use uri.path to determine which screen to navigate to
    if (uri.host == 'flutter.dev') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TextPostScreen()),
      );
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final Size screenSize =
            Size(constraints.maxWidth, constraints.maxHeight);

        return ScreenUtilInit(
          designSize: screenSize,
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            );
          },
        );
      },
    );
  }
}
