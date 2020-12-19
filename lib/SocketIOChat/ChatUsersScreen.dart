import 'package:chat_app/SocketIOChat/ChatMessageModel.dart';
import 'package:chat_app/SocketIOChat/Global.dart';
import 'package:chat_app/SocketIOChat/LoginScreen.dart';
import 'package:chat_app/SocketIOChat/User.dart';
import 'package:flutter/material.dart';

class ChatUsersScreens extends StatefulWidget {
  @override
  _ChatUsersScreensState createState() => _ChatUsersScreensState();

  static const String ROUTE_ID = 'chat_user_screen';
}

class _ChatUsersScreensState extends State<ChatUsersScreens> {
  List<ChatMessageModel> _chatMessages;
  @override
  void initState() {
    super.initState();
  }

  _openLoginScreen(BuildContext context) async {
    await Navigator.pushReplacementNamed(
      context,
      LoginScreen.ROUTE_ID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat users screen chat"),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _openLoginScreen(context);
              })
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: _chatUsers.length,
                itemBuilder: (context, index) {
                  User user = _chatUsers[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email + ' ' + user.id.toString()),
                  );
                },
              ),
            ),
          ])),
    );
  }
}
