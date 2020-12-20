import 'package:chat_app/SocketIOChat/User.dart';

class Global {
  static List<User> dummyUsers;
  static User loggedInUser;
  static User toChatUser;

  static void initDummyUsers() {
    User userA = new User(id: 1000, name: "a", email: "bror@bror.com");
    User userB = new User(id: 1030, name: "b", email: "FUCKINGbror@bror.com");
    dummyUsers = List();
    dummyUsers.add(userA);
    dummyUsers.add(userB);
    print(dummyUsers);
  }

  static List<User> getUsersFor(User user) {
    List<User> filteredUsers = dummyUsers
        .where((u) => (!u.name.toLowerCase().contains(user.name.toLowerCase())))
        .toList();
    return filteredUsers;
  }
}
