void main() {
  // generic can be used as type safety
  // this mean userName can only contain String
  // if we try fill userName with other type, it will throw error
  var userName = <String>{'John', 'Andre'};

  // this is will throw error on editor
  // because we try to fill userNameError with int
  // try uncomment code bellow
  // var userNameError = <String>{'John', 'Andre', 1};

  print('No error happen so this code running until finish');
}
