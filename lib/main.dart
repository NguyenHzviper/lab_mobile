import 'package:flutter/material.dart';
import 'package:lab05/animations/slide_left_transition.dart';
import 'package:lab05/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Example',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SlideLeftTransition(),
          },
        ),
      ),
      home: HomePage(),
    );
  }
}
