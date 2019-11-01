import 'package:flutter/material.dart';

///https://blog.csdn.net/qq_39969226/article/details/90171163
class FormUseGlobalKeyDemo extends StatefulWidget {
  @override
  _FormState createState() {
    return _FormState();
  }
}

final _formKey = GlobalKey<FormState>();

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



  Widget _createForm() {
    return Container(
      child:Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                ///value就是你输入的值
                if (value.isEmpty) {
                  return 'Please enter some text!!';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: _createSubmitButton2(),
            ),
          ],
        ),
      ) ,
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

  Widget _createSubmitButton() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
        }
      },
      child: Text('Submit'),
    );
  }
}
