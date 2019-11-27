import 'package:flutter/material.dart';
import 'package:login_demo/FormUseGlobalKeyDemo.dart';
import 'package:login_demo/FormWithoutGlobalKey.dart';

import 'Hourglass.dart';
import 'LoginPage.dart';

void main() => runApp(FlutterDemo());

class FlutterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Login_Demo", home: FlutterHome());
  }
}

class FlutterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login_Demo"),
      ),
//      body:DebugDump(),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) {
            return ListTile(
              title: Text(list[position].name),
              onTap: () {
                Navigator.push(context,  MaterialPageRoute(builder: list[position].builder));
              },
            );
          }),
    );
  }

  Widget _createWidget() {
    return Stack(
      children: <Widget>[RawImage(), Center(), RawImage()],
    );
  }
}

class _RouterInfo {
  String name;
  WidgetBuilder builder;

  _RouterInfo({this.name, this.builder});
}

final List<_RouterInfo> list = <_RouterInfo>[
  _RouterInfo(name: "时间沙漏的使用--->", builder: (context) => Hourglass()),
  _RouterInfo(
      name: "Form表单的使用1--->", builder: (context) => FormUseGlobalKeyDemo()),
  _RouterInfo(
      name: "Form表单的使用2--->", builder: (context) => FormWithoutGlobalKey()),

  _RouterInfo(
      name: "登录页面--->", builder: (context) => LoginPage()),
];
