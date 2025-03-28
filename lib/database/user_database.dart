import 'package:atividade/models/user.model.dart';

abstract class UserDatabase {
  static final List<User> _users = [User('teste', '12345678910', '(83)99485-3399', 'teste')];

  static void addUser(String email, String cpf, String phone, String password) {
    _users.add(User(email, cpf, phone, password));
  }

  static User? getUserByEmail(String email) {
    for (User user in _users) {
      if (user.email == email) {
        return user;
      }
    }
    return null;
  }

  static bool containsEmail(String email) {
    for (User user in _users) {
      if (user.email == email) {
        return true;
      }
    }
    return false;
  }

  static bool validateUser(String email, String password) {
    if (containsEmail(email)) {
      User? user = getUserByEmail(email);
      if (user != null && user.password == password) {
        return true;
      }
    }
    return false;
  }
}
