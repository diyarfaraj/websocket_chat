import 'package:chat_app/SocketIOChat/ChatMessageModel.dart';
import 'package:chat_app/SocketIOChat/ChatScreen.dart';
import 'package:chat_app/SocketIOChat/Global.dart';
import 'package:chat_app/SocketIOChat/LoginScreen.dart';
import 'package:chat_app/SocketIOChat/User.dart';
import 'package:flutter/material.dart';

class ChatUsersScreen extends StatefulWidget {
  ChatUsersScreen() : super();
  @override
  _ChatUsersScreenState createState() => _ChatUsersScreenState();

  static const String ROUTE_ID = 'chat_user_screen';
}

class _ChatUsersScreenState extends State<ChatUsersScreen> {
  List<User> _chatUsers;

  bool _connectedToSocket;
  String _errorConnectMessage;

  @override
  void initState() {
    super.initState();
    _connectedToSocket = false;
    _errorConnectMessage = 'Connecting ...';
    _chatUsers = Global.getUsersFor(Global.loggedInUser);
    _connectToSocket();
  }

  _connectToSocket() async {
    print(
        'connection logged in user ${Global.loggedInUser.name}, ${Global.loggedInUser.id}');
    await Global.initSocket();
    Global.socketUtils.initSocket(Global.loggedInUser);
    Global.socketUtils.connectToSocket();
    Global.socketUtils.setOnConnectListener(onConnect);
    Global.socketUtils.setOnConnectionErrorListener(onConnectError);
    Global.socketUtils.setOnConnectionTimeoutListener(onConnectTimeout);
    Global.socketUtils.setOnDisconnectListener(onDisconnect);
    Global.socketUtils.setOnErrorListener(onError);
  }

  onConnect(data) {
    print('Connected $data');
    setState(() {
      _connectedToSocket = true;
    });
  }

  onConnectError(data) {
    print('onConnectError $data');
    setState(() {
      _connectedToSocket = false;
      _errorConnectMessage = 'Failed to Connect';
    });
  }

  onConnectTimeout(data) {
    print('onConnectTimeout $data');
    setState(() {
      _connectedToSocket = false;
      _errorConnectMessage = 'Connection timedout';
    });
  }

  onError(data) {
    print('onError $data');
    setState(() {
      _connectedToSocket = false;
      _errorConnectMessage = 'Connection Failed';
    });
  }

  onDisconnect(data) {
    print('onDisconnect $data');
    setState(() {
      _connectedToSocket = false;
      _errorConnectMessage = 'Disconnected';
    });
  }

  _openChatScreen(BuildContext context) async {
    await Navigator.pushNamed(
      context,
      ChatScreen.ROUTE_ID,
    );
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
        child: Column(
          children: [
            Text(_connectedToSocket ? 'Connected' : _errorConnectMessage),
            Expanded(
              child: ListView.builder(
                itemCount: _chatUsers.length,
                itemBuilder: (context, index) {
                  User user = _chatUsers[index];
                  return ListTile(
                    onTap: () {
                      Global.toChatUser = user;
                      _openChatScreen(context);
                    },
                    title: Text(user.name),
                    subtitle: Text(user.email + ' ' + user.id.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//craete chat area below

}
