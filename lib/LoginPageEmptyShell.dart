import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
///这是一个空壳的登录UI界面，不具备任何功能
class LoginPageEmptyShell extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageEmptyShell> {
  GlobalKey<FormState> _signInFormKey = new GlobalKey();
  bool isShowPassWord = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          ///全屏大小的布局
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          child: Center(
            ///登录按钮居中
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white
                ),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ///类似于topView的marginTop值
                      _buildSignInTextForm(),

                      ///用户名密码输入框
                      _buildSignInButton(),

                      ///登录按钮
                      SizedBox(height: 15.0),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    child: _buildLoading(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// 创建登录界面的TextForm
  Widget _buildSignInTextForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 190,
      child: Form(
        key: _signInFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildUserNameTextField(), ///创建用户名输入框
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.75,
              color: Colors.grey[400],
            ),
            _buildPasswordTextField(),///创建登录密码输入框
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.75,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
        child: TextFormField(
          decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            hintText: "密码",
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.black,
              ),
              onPressed: _showPassWord,
            ),
          ),
          //输入密码，需要用*****显示
          obscureText: !isShowPassWord,
          style: TextStyle(fontSize: 16, color: Colors.black),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "密码不可为空!";
            }
            return null;
          },
          onSaved: (value) {
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _buildUserNameTextField() {
    return Flexible(
      child: Padding(
        padding:
        const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
        child: TextFormField(
          //关联焦点
          decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: "用户名",
              border: InputBorder.none),
          style: TextStyle(fontSize: 16, color: Colors.black),
          //验证
          validator: (value) {
            if (value.isEmpty) {
              return "登录名不可为空!";
            }
            return null;
          },
          onSaved: (value) {
            setState(() {});
          },
        ),
      ),
    );
  }

  //创建登录按钮
  Widget _buildSignInButton() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Theme.of(context).primaryColor),
        child: Text(
          "登录",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      onTap: () {
        // 利用key来获取widget的状态FormState,可以用过FormState对Form的子孙FromField进行统一的操作
        if (_signInFormKey.currentState.validate()) {
          doLogin();
        }
      },
    );
  }

  // 登陆操作
  doLogin() {
    _signInFormKey.currentState.save();
    setState(() {
      isLoading = true;
    });
  }

// 点击控制密码是否显示
  void _showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  ///创建时间沙漏
  Widget _buildLoading() {
    if (!isLoading) {
      return Container();
    }
    return Opacity(
      opacity: .5,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.black,
        ),
        child: SpinKitPouringHourglass(color: Colors.red),
      ),
    );
  }


}
