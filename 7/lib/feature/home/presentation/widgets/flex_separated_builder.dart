import 'package:flutter/material.dart';

class FlexSeparatedBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index) separatorBuilder;
  final int itemCount;
  final Axis direction;

  const FlexSeparatedBuilder({
    super.key,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.itemCount,
    this.direction = Axis.horizontal,
  });

  List<Widget> _builder(BuildContext context) {
    var widget = <Widget>[];

    for (int index = 0; index < itemCount; index++) {
      widget.add(itemBuilder(context, index));
      if (index != itemCount - 1) {
        widget.add(separatorBuilder(context, index));
      }
    }

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      children: _builder(context),
    );
  }
}
