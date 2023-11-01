import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // we use padding to set space inside
      // in this code, we set all space inside container with 10
      padding: EdgeInsets.all(10),
      // we use padding to set space outside
      // in this code, we set all space outside container with 10
      margin: EdgeInsets.all(10),
      // we can use alignment to set alignment for child inside containeer
      // in this code, we set alignment to bottom center
      alignment: Alignment.bottomCenter,
    );
  }
}