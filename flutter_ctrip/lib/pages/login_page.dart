import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_ctrip/viewmodel/loginViewModel.dart';

/**
 * 登录页
 */
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.arguments}) : super(key: key);
  final Map arguments;

  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  LoginViewModel loginVM;
  //var _username = "";
  //var _password = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 获取LoginPage  model 的值
    print(widget.arguments);
    // 网络请求
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // 账号输入框
  Widget _accountTextField() {
    return TextField(
      obscureText: false,
      controller: loginVM.userNameController,
      decoration: InputDecoration(hintText: "请输入账号"),
      onChanged: (value) {
        setState(() {
          //this._username = value;
        });
      },
    );
  }

  // 密码输入框
  Widget _passwordTextField() {
    return TextField(
      obscureText: true,
      controller: loginVM.passwordController,
      decoration: InputDecoration(hintText: "请输入密码"),
      onChanged: (value) {
        setState(() {
          //this._password = value;
        });
      },
    );
  }

  Widget _loginButton() {
    return Container(
      width: 300,
      child: RaisedButton(
        child: Text("登录"),
        color: Colors.blue,
        onPressed: () async {
          loginVM.loginHandel(context);
        },
      ),
    );
  }

  Widget _registerButton() {
    return RaisedButton(
      child: Text("注册账号"),
      color: Colors.red,
      textColor: Colors.white,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    loginVM = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Column(
        children: [
          _accountTextField(),
          SizedBox(
            height: 5,
          ),
          _passwordTextField(),
          _loginButton(),
          _registerButton()
        ],
      ),
    );
  }
}
