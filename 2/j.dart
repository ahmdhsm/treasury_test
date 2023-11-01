void main() {
  var testClass = TestClass();

  testClass.testMethod();

  print('No error happen so this code running until finish');
}

class TestClass {
  var name = 'Andre';

  testMethod() {
    var name = 'John';

    // this is should print Andre because we use this
    // 'this' will refer to instance level
    print(this.name);

    // this is should print John because we not use 'this'
    // this variable reference to method level variable
    print(name);
  }
}
