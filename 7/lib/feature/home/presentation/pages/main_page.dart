import 'package:flutter/material.dart';
import 'package:treasury_test/core/app_text_style.dart';
import 'package:treasury_test/feature/home/presentation/widgets/c_widget.dart';

import '../widgets/flex_separated_builder.dart';
import '../widgets/menu_widget.dart';

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
