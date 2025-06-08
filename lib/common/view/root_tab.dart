import 'package:flutter/material.dart';
import 'package:my_firstapp/common/const/colors.dart';
import 'package:my_firstapp/common/layout/default_layout.dart';

class RootTab extends StatelessWidget {
  const RootTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: Center(
        child: Text('RootTab'),
      ),
    );
  }
}