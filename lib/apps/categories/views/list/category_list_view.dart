import 'package:dailycooking/export_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const VText('Categories')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: const VText('Carbs'),
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
