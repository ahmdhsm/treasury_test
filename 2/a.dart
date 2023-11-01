void main() {
  // can set null in this variable because this varibale have "?" after variable type
  String? name = null;

  // can return null in this method because this method have "?" after type
  String? getName() {
    return null;
  }

  // we can set null in this variable because this varibale have "?" after variable type
  User? user;

  // we can use "?" to null check method or variable invokation
  // when user is null, it will not throw error
  // it just set "userName" with null
  var userName = user?.name;

  // we also can use "?" like this
  // this mean userNameWithoutNull cannot have null value
  // when getName method return null, userNameWithoutNull will have value John
  var userNameWithoutNull = getName() ?? 'John';

  print('No error happen so this code running until finish');
}

// example object for casee
class User {
  User({required this.name});

  final String name;
}
