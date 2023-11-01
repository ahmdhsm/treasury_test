import 'package:flutter/material.dart';
import 'package:treasury_test/core/app_text_style.dart';

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
