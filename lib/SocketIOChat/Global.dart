import 'package:chat_app/SocketIOChat/User.dart';

class Global {
  static List<User> dummyUsers;
  static User loggedInUser;

  static void initDummyUsers() {
    User userA = User(id: 1000, name: "bror", email: "bror@bror.com");
    User userB =
        User(id: 1030, name: "FUCKINGbror", email: "FUCKINGbror@bror.com");
    dummyUsers = List();
    dummyUsers.add(userA);
    dummyUsers.add(userB);
  }

  static List<User> getUsersFor(User user) {
    List<User> filteredUsers =
        dummyUsers.where((u) => u.id == user.id).toList();
    return filteredUsers;
  }
}
