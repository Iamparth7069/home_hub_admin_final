import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../constant/repo.dart';
import '../../../models/Response Model/service_provider_req_res_model.dart';

class ServiceProviderMenagementController extends GetxController {
  List<ServiceProviderReqResModel> pendingReq = [];
  List<ServiceProviderReqResModel> completedReq = [];
  List<ServiceProviderReqResModel> rejectedReq = [];

  @override
  void onInit() {
    super.onInit();

    getAlleProviderRequest();
  }

  Future<void> getAlleProviderRequest() async {
    Stream<QuerySnapshot> allData = serviceProviderRequestCollection.snapshots();
    allData.listen((event) {
      pendingReq.clear();
      completedReq.clear();
      rejectedReq.clear();
      event.docs.forEach((element) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;
        ServiceProviderReqResModel serviceProviderReqResModel =
        ServiceProviderReqResModel.formMap(data);
        if (serviceProviderReqResModel.status == "Pending") {
          pendingReq.add(serviceProviderReqResModel);
        } else if (serviceProviderReqResModel.status == "Completed") {
          completedReq.add(serviceProviderReqResModel);
        } else {
          rejectedReq.add(serviceProviderReqResModel);
        }
      });
      update();
    });
  }
}
