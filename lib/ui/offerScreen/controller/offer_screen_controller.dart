import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../constant/repo.dart';
import '../../../models/Response Model/offer_res_model.dart';

class OfferScreenController extends GetxController{
  List<OfferResModel> offersData = [];
  bool loadData = false;
  @override
  void onInit() {
    super.onInit();
    getAllOfferData();
  }

  void getAllOfferData() {
    loadData = true;
    update();
    Stream<QuerySnapshot> data = offerCollection.snapshots();
    offersData.clear();
    data.listen((event) {
      offersData.clear();
      event.docs.forEach((element) {
        OfferResModel offerResModel =
        OfferResModel.fromMap(element.data() as Map<String, dynamic>);
        offersData.add(offerResModel);
      });
      loadData = false;
      update();
    });
  }
}