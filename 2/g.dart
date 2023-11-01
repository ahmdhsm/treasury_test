void main() {
  // generin in this code used to type safe list
  // this userName can only contain String
  var userName = <String>['Andre', 'John'];

  // this code will throw error in editor
  // because we try to add int to userName
  // try uncomment code bellow
  // userName.add(1);

  print('No error happen so this code running until finish');
}
