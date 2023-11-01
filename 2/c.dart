void main() {
  List<int> listInteger = [1, 2, 3];

  // instead return void, when we use cascade notation to call add method,
  // this action will return List<int>, which is listInteger type
  listInteger..add(4);

  // this way is usefull if we need to call sequence method without
  // create new temporary variable
  listInteger
    ..add(5)
    ..add(6);

  print(listInteger);

  print('No error happen so this code running until finish');
}
