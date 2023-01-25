import 'package:flutter/material.dart';
import 'package:flutter_xhs/api/api_client.dart';
import 'package:flutter_xhs/constants/pages.dart';
import 'package:flutter_xhs/models/card_data.dart';
import 'package:get/get.dart';

class MineController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<CardData> data = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    getIndexData();
  }

  void getIndexData() {
    ApiClient().getIndexData().then((response) {
      data = response;
      update();
    });
  }

  void openIndexDetailPage(int id) {
    Get.toNamed(Pages.indexDetail, arguments: {"id": id});
  }
}
