import 'package:flutter/material.dart';
import 'package:flutter_xhs/api/api_client.dart';
import 'package:flutter_xhs/constants/pages.dart';
import 'package:flutter_xhs/models/card_data.dart';
import 'package:get/get.dart';

class IndexController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<CardData> data = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
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
