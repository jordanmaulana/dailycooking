import 'package:dailycooking/apps/categories/views/list/category_list_view.dart';
import 'package:dailycooking/apps/cooks/list/cook_list_view.dart';
import 'package:dailycooking/apps/meals/list/meals_list_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../export_view.dart';
import '../controllers/main_nav_controller.dart';

class MainNavView extends StatelessWidget {
  const MainNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainNavController controller = Get.put(MainNavController());

    return WillPopScope(
      onWillPop: () => controller.onWillPop(context),
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() {
              return IndexedStack(
                index: controller.index.value,
                children: const [
                  MealList(),
                  CookList(),
                  CategoryList(),
                ],
              );
            }),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.index.value,
            selectedItemColor: Colors.deepPurple,
            onTap: (v) {
              controller.setIndex(v);
            },
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.cheese),
                label: 'My Meals',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.spoon),
                label: 'Cookings',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.folder),
                label: 'Categories',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  final String icon;
  final bool active;
  const BottomIcon({required this.icon, required this.active, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: active ? VStyle.shadow() : null,
              color: active ? VColor.white : Colors.transparent,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/svgs/main_nav/$icon.svg',
              width: 20.0,
              height: 20.0,
              colorFilter: ColorFilter.mode(
                active ? VColor.green : VColor.white,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
    );
  }
}
