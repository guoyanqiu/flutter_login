import 'package:flutter/material.dart';

///不用用GlobalKey来使用Form表单
class FormWithoutGlobalKey extends StatefulWidget {
  @override
  _FormState createState() {
    return _FormState();
  }
}

class _FormState extends State<FormWithoutGlobalKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("不使用GlobalKey的Form表单"),
      ),
      body: _createForm(),
    );
  }
  Widget _createForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return '请输入文字s';
              }
              return null;
            },
          ),
          _createSubmitButton2(),
        ],
      ),
    );
  }
  Widget _createSubmitButton2() {
    return Builder(builder: (context) {
      return RaisedButton(
        child: Text('Submit2'),
        onPressed: () {
          if (Form.of(context).validate()) {
            //验证通过提交数据
          }
        },
      );
    });
  }
}
