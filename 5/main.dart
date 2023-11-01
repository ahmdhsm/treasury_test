import 'package:flutter/material.dart';

// stateless only contain one class, Widget
// we cannot change state of stateless because state in stateless is immutable
class StatelessExample extends StatelessWidget {
  const StatelessExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// statefull contain two class, State and Widget
// statefull state can be changed, because it's mutable
class StatefullExample extends StatefulWidget {
  const StatefullExample({super.key});

  @override
  State<StatefullExample> createState() => _StatefullExampleState();
}

class _StatefullExampleState extends State<StatefullExample> {
  void test() {
    // we can change statefull state with setState method
    // when we call setState, this state will rebuild
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
