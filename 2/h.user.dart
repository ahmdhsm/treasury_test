class User {
  // we can't call this property outside User class
  // because this property marked with underscore
  // so this property will become private
  String? _name;

  // underscore can also be used on method
  String? _getName() => _name;
}

class User2 extends User {}
