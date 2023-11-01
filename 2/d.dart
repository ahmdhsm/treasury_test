void main() {
  var list1 = <int>[1, 2, 3];
  var list2 = <int>[4, 5, 6];

  // this new list will be filled with list1 and list2 because we use Spread Operator
  // value of newList will be [1, 2, 3, 4, 5, 6]
  // which is combination of list1 and list2
  var newList = <int>[...list1, ...list2];

  print(newList);

  print('No error happen so this code running until finish');
}
