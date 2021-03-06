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
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  LoginViewModel loginVM;

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

  // https://www.jianshu.com/p/54419a143d70
  // 账号输入框
  Widget _accountTextField() {
    /*
    return TextField(
      obscureText: false,
      maxLength: 30,
      maxLines: 1,
      controller: loginVM.userNameController,
      decoration: InputDecoration(hintText: "请输入账号"),
      style: TextStyle(fontSize: 15, color: Colors.red),
      onChanged: (value) {
        setState(() {
          //this._username = value;
        });
      },
      onSubmitted: (value) {

      },
      enabled: false,
    );
    */
    // 带清除按钮
    return new Stack(alignment: const Alignment(1.0, 1.0), children: <Widget>[
      new TextField(
        controller: _userNameController,
      ),
      new FlatButton(
          onPressed: () {
            _userNameController.clear();
          },
          child: new Icon(Icons.clear))
    ]);
  }

  // 密码输入框
  Widget _passwordTextField() {
    return TextField(
      obscureText: true,
      controller: _passwordController,
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
