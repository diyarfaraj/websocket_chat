import 'dart:io';

import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:chat_app/SocketIOChat/User.dart';

class SocketUtils {
  static String _serverIP =
      Platform.isIOS ? 'http://localhost' : 'http://10.0.2.2';
  static const int SERVER_PORT = 6000;
  static String _connectUrl = '$_serverIP:$SERVER_PORT';

//EVENTS
  static const String _ON_MESSAGE_RECIEVED = 'recieve_message';
  static const String _USER_ONLINE_EVENT = 'check_online';

//STATUS
  static const int _STATUS_MESSAGE_NOT_SENT = 10001;
  static const int _STATUS_MESSAGE_SENT = 10002;

  //type of chat
  static const String STNGLE_CHAT = 'single_chat';

  User _fromUser;

  SocketIO _socket;
  SocketIOManager _manager;

  initSocket(User fromUser) async {
    this._fromUser = fromUser;
    print('connection ....${fromUser.name}');
    await _init();
  }

  _init() async {
    _manager = SocketIOManager();
    _socket = await _manager.createInstance(_socketOptions());
  }

  connectToSocket() {
    if (null == _socket) {
      print('socket is null');
      return;
    }
    _socket.connect();
  }

  _socketOptions() {
    final Map<String, String> userMap = {
      'from': _fromUser.id.toString(),
    };
    return SocketOptions(
      _connectUrl,
      enableLogging: true,
      transports: [Transports.WEB_SOCKET],
      query: userMap,
    );
  }

  setOnConnectListener(Function onConnect) {
    _socket.onConnect((data) {
      onConnect(data);
    });
  }

  setOnConnectionTimeoutListener(Function onConnectionTimeout) {
    _socket.onConnectTimeout((data) {
      onConnectionTimeout(data);
    });
  }

  setOnConnectionErrorListener(Function onConnectionError) {
    _socket.onConnectError((data) {
      onConnectionError(data);
    });
  }

  setOnErrorListener(Function onError) {
    _socket.onConnectError((data) {
      onError(data);
    });
  }

  setOnDisconnectListener(Function onDisconnect) {
    _socket.onDisconnect((data) {
      onDisconnect(data);
    });
  }

  closeConnection() {
    if (null != _socket) {
      print('closing connnection');
      _manager.clearInstance(_socket);
    }
  }
}
