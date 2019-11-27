import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
///时间沙漏
class Hourglass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("时间沙漏效果"),
      ),
      body:SpinKitPouringHourglass(color: Colors.red),
    );
  }

}