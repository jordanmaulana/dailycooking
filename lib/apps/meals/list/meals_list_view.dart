import 'package:dailycooking/core/widgets/texts.dart';
import 'package:flutter/material.dart';

class MealList extends StatelessWidget {
  const MealList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const VText('My Meals')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ListTile(
            title: VText('20 November 2023'),
            subtitle: VText('5 Categories'),
            trailing: Icon(Icons.chevron_right),
          );
        },
      ),
    );
  }
}
