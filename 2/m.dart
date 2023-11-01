// we can use 'as' when import package to casting import
// this is will be usefull when we have same name for property, class, or method in other file
import 'm.user.dart' as user;

void main() {
  // when we need call method or class in that fille
  // we can use 'user' which we use as cast in import
  var userVarible = user.User();

  var json = {
    'name': 'Andre',
  };

  // we can also use as in variable to casting varible type
  var newJson = json as Map<String, String>;

  newJson.addAll({'month': 'January'});

  print('This is should not displayed because this code is error ata line 7');
}
