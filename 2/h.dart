import 'h.user.dart';

void main() {
  var user = User();
  var user2 = User2();

  // we cannot call this property because this property is marked as private
  // try uncomment code bellow
  // user._name;

  // we cannot call this method because this method is marked as private
  // try uncomment code bellow
  // user._getName();

  print('No error happen so this code running until finish');
}
