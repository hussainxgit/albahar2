import 'package:hive/hive.dart';

class UsersBox {
  static void userPut(String name) async {
    final _usersBox = await Hive.openBox('usersBox');
    _usersBox.put('name', name);
    print('Name: ${_usersBox.get('name')}');
  }
}
