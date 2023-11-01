// first we need to declare our typedef
// we declare IntList is List<int>
typedef IntList = List<int>;

void main() {
  // we can use our typedef like we using List<int>
  IntList list = [1, 2, 3];

  // we can call sum method because we already create extension for it
  print(list.sum());
}

// we can also create extension for our typedef
extension SumIntList on IntList {
  // we will create extension to get sum of our list
  // we can call sum from our typedef
  int sum() {
    var total = 0;
    for (var number in this) {
      total += number;
    }
    return total;
  }
}
