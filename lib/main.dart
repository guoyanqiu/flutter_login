import 'package:flutter/material.dart';
import 'package:login_demo/FormUseGlobalKeyDemo.dart';

import 'Hourglass.dart';

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
          itemBuilder: (context,position){
            return   ListTile(
              title: Text(list[position].name),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder:list[position].builder));
              },
            );
          }
      ),
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
  _RouterInfo(name: "Form表单的使用--->", builder: (context) => FormUseGlobalKeyDemo()),
];
