import 'package:flutter/material.dart';

class ChatUsersScreens extends StatefulWidget {
  @override
  _ChatUsersScreensState createState() => _ChatUsersScreensState();

  static const String ROUTE_ID = 'chat_user_screen';
}

class _ChatUsersScreensState extends State<ChatUsersScreens> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat users screen chat"),
      ),
      body: Container(
        child: Text("chat usrs screen"),
      ),
    );
  }
}
