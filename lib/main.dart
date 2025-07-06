import 'package:flutter/material.dart';
import 'package:my_firstapp/common/component/custom_text_form_field.dart';
import 'package:my_firstapp/common/view/splash_screen.dart';
import 'package:my_firstapp/user/view/login_screen.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSans'),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
