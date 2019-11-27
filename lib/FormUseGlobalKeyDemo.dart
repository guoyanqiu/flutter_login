import 'package:flutter/material.dart';

///https://blog.csdn.net/qq_39969226/article/details/90171163
///
/// /**
///使用GlobalKey来使用Form
class FormUseGlobalKeyDemo extends StatefulWidget {
  @override
  _FormState createState() {
    return _FormState();
  }
}


class _FormState extends State<FormUseGlobalKeyDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使用GlobalKey的Form表单"),
      ),
      body: _createForm(),
    );
  }

  final _formKey = GlobalKey<FormState>();
  Widget _createForm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {///输入字符校验
                if (value.isEmpty) {
                  return '请输入文字';
                }
                return null;
              },
            ),
            _createSubmitButton(),///创建submit按钮
          ],
        ),
    );
  }

  Widget _createSubmitButton() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {///点击时开始非空验证
          }
      },
      child: Text('Submit'),
    );
  }
}
