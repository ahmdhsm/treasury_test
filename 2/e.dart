void main() {
  var multiplyVariable = multiply(3, 4);

  print(multiplyVariable);

  print('No error happen so this code running until finish');
}

// instead use return, if our method only contain one expression
// we can use arrow syntax to make our code shorter
int multiply(int x, int y) => x * y;
