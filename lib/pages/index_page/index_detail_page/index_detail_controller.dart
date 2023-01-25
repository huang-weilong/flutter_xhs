import 'package:flutter_xhs/api/api_client.dart';
import 'package:flutter_xhs/models/card_detail_data.dart';
import 'package:flutter_xhs/models/comment.dart';
import 'package:get/get.dart';

class IndexDetailController extends GetxController {
  late CardDetailData cardDetailData;
  late int id;
  bool isLoading = true;
  bool isFail = false;
  List<Comment> commentList = [];

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments["id"];
    getIndexDetailData(id);
    getCommentList();
  }

  void getIndexDetailData(int id) {
    ApiClient().getIndexDetailDataById(id).then((response) {
      if (response != null) {
        cardDetailData = response;
      } else {
        isFail = true;
      }
      update();
    }).catchError((onError) {
      isFail = true;
    }).whenComplete(() {
      isLoading = false;
    });
  }

  void getCommentList() {
    ApiClient().getCommentList().then((response) {
      commentList = response;
      update();
    });
  }
}
