import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../export_view.dart';

class CookList extends StatelessWidget {
  const CookList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const VText('Cookings')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: const VText('Kentang Rebus'),
            subtitle: const VText('Carbs'),
            trailing: IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                size: 14.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
