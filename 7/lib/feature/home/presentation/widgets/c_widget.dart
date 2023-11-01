import 'package:flutter/material.dart';
import 'package:treasury_test/feature/home/presentation/widgets/measure_size.dart';

class CWidget extends StatefulWidget {
  const CWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CWidget> createState() => _CWidgetState();
}

class _CWidgetState extends State<CWidget> {
  var height = 0.0;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: MeasureSize(
        onChange: (size) {
          setState(() {
            height = size.width * 125 / 100;
          });
        },
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
