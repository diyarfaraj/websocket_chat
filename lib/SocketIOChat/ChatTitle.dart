import 'package:flutter/material.dart';

import 'User.dart';

enum UserStatus { conntecting, online, offline }

class ChatTitle extends StatelessWidget {
  final User toChatUser;
  final UserStatus userStatus;

  const ChatTitle(
      {Key key, @required this.toChatUser, @required this.userStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(toChatUser.name),
          Text(
            _getStatusText(),
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }

  _getStatusText() {
    if (userStatus == UserStatus.online) {
      return 'online';
    }

    if (userStatus == UserStatus.offline) {
      return 'offline';
    }

    return 'connecting';
  }
}
