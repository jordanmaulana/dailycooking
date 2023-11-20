import '../../../core/widgets/texts.dart';
import '../../../export_controller.dart';

class MainNavController extends GetxController {
  var index = 0.obs;
  DateTime? currentBackPressTime;

  void setIndex(int v) {
    index(v);
  }

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        const SnackBar(
            content: VText('Press again to exit', color: Colors.white),
            backgroundColor: Colors.black87),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
