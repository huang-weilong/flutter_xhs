import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'init_controller.dart';

class InitPage extends StatelessWidget {
  InitPage({Key? key}) : super(key: key);
  final InitController controller = Get.put(InitController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
