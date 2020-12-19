import 'package:chat_app/SocketIOChat/ChatUsersScreen.dart';
import 'package:chat_app/SocketIOChat/LoginScreen.dart';

class Routes {
  static routes() {
    return {
      LoginScreen.ROUTE_ID: (context) => LoginScreen(),
      ChatUsersScreens.ROUTE_ID: (context) => ChatUsersScreens(),
    };
  }

  static initScreen() {
    return LoginScreen.ROUTE_ID;
  }
}
