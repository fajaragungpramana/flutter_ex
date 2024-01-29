import 'package:get/get.dart';

class MainController extends GetxController {

  final RxInt _bnvSelectedIndex = 0.obs;
  int get bnvSelectedIndex => _bnvSelectedIndex.value;

  void setBnvSelectedIndex(int index) async {
    _bnvSelectedIndex.value = index;
  }

}