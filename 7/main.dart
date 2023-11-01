import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPageWidget(),
    );
  }
}

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

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant MeasureSizeRenderObject renderObject,
  ) {
    renderObject.onChange = onChange;
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  int? expandedIndex;

  bool isExpanded(int index) {
    if (expandedIndex == null) return false;
    if (index == expandedIndex) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 1000),
      expansionCallback: (index, isExpanded) {
        if (isExpanded == true) {
          setState(() {
            expandedIndex = index;
          });
        } else {
          setState(() {
            expandedIndex = null;
          });
        }
      },
      children: [
        for (int i = 0; i < 20; i++)
          ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 10,
                ),
                child: Text('Menu ${i + 1}'),
              );
            },
            body: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 10,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Information',
                        style: AppTextStyle.title(),
                      ),
                      TextButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print('Menu ${i + 1}');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                  Text('Name ${i + 1}'),
                  Text('Address ${i + 1}'),
                ],
              ),
            ),
            isExpanded: isExpanded(i),
          ),
      ],
    );
  }
}

class MainPageWidget extends StatelessWidget {
  MainPageWidget({super.key});

  final controller = <ExpansionTileController>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Main Page',
              style: AppTextStyle.title(),
            ),
            Text(
              'Welcome',
              style: AppTextStyle.subtitle(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Add'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FlexSeparatedBuilder(
                itemBuilder: (context, index) {
                  return CWidget(
                    title: 'C${index + 1}',
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 15);
                },
                itemCount: 3,
              ),
            ),
            const SizedBox(height: 100),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MenuWidget(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AppTextStyle {
  static TextStyle title() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle subtitle() {
    return const TextStyle(
      fontSize: 12,
    );
  }
}
