import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * 登录页
 */
class LoginPage extends StatefulWidget {
  // 上一个页面传值
  final String model; //SecondController的model属性
  LoginPage({Key key, @required this.model}) : super(key: key); //接收传递过来的值

  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  var _username = "";
  var _password = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 获取LoginPage  model 的值
    print(widget.model);

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
      decoration: InputDecoration(hintText: "请输入账号"),
      onChanged: (value) {
        setState(() {
          this._username = value;
        });
      },
    );
  }

  // 密码输入框
  Widget _passwordTextField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: "请输入密码"),
      onChanged: (value) {
        setState(() {
          this._password = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Column(
        children: [
          _accountTextField(),
          SizedBox(
            height: 20,
          ),
          _passwordTextField(),
          Container(
            width: 300,
            child: RaisedButton(
              child: Text("登录"),
              color: Colors.blue,
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setString('username', _username);
                sharedPreferences.setString('password', _password);
              },
            ),
          ),
          RaisedButton(
            child: Text("注册账号"),
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
