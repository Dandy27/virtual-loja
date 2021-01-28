import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:virtualloja_app/models/user.dart';
import 'package:virtualloja_app/models/user_manager.dart';

class AdminUsersManager extends ChangeNotifier {

  List<User> users = [];

  void updateUser(UserManager userManager) {
    if (userManager.adminEnabled)
    _listenToUser();
  }

  void _listenToUser() {
    const faker = Faker();

    for (int i = 0; i < 100; i++) {
      users.add(User(
        name: faker.person.name(),
        email: faker.internet.email()
      ));
    }

    users..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    notifyListeners();
  }

  List<String> get names => users.map((e) => e.name).toList();

}
