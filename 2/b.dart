void main() {
  // this mean user can have null value
  User? user;

  // if we use postfix operator error will not shown in editor
  // but when we run this code, error will shown in console
  user!.name;

  // postfix operator also cast variable to non-nullable type
  var newUser = user!;

  print('This is should not displayed because this code is error ata line 7');
}

class User {
  User({required this.name});

  final String name;
}
