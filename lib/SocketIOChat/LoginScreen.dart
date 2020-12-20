import 'package:chat_app/SocketIOChat/ChatUsersScreen.dart';
import 'package:chat_app/SocketIOChat/Global.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen() : super();

  @override
  _LoginScreenState createState() => _LoginScreenState();

  static const String ROUTE_ID = 'login_screen';
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    Global.initDummyUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebsocketIO chat"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {
                  _loginBtnTap();
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }

  _loginBtnTap() async {
    if (_usernameController.text.isEmpty) {
      return;
    }
    User diyar = Global.dummyUsers[0];
    print(Global.dummyUsers[0].name);

    if (_usernameController.text != 'a') {
      diyar = Global.dummyUsers[1];
    }
    Global.loggedInUser = diyar;

    openChatUsersListScreen(context);
  }

  static openChatUsersListScreen(BuildContext context) async {
    await Navigator.pushReplacementNamed(
      context,
      ChatUsersScreen.ROUTE_ID,
    );
  }
}
