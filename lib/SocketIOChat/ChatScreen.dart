import 'package:chat_app/SocketIOChat/ChatMessageModel.dart';
import 'package:chat_app/SocketIOChat/ChatTitle.dart';
import 'package:chat_app/SocketIOChat/ChatUsersScreen.dart';
import 'package:chat_app/SocketIOChat/Global.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen() : super();

  @override
  _ChatScreenState createState() => _ChatScreenState();

  static const String ROUTE_ID = 'chat_screen';
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageModel> _chatMessages;
  User _toChatUser;
  UserStatus _userStatus;

  TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _toChatUser = Global.toChatUser;
    _userStatus = UserStatus.conntecting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ChatTitle(
          toChatUser: Global.toChatUser,
          userStatus: _userStatus,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
