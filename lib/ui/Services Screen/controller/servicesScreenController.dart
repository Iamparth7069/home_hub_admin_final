import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constant/repo.dart';
import '../../../models/Response Model/service_res_model.dart';
import '../../../utils/extension.dart';

class ServiceScreenController extends GetxController{
  List<ServiceResModel> allServices = [];
  List<ServiceResModel> searchServices = [];

  ImagePicker imagePicker = ImagePicker();

  File? image;
  TextEditingController serviceNameController = TextEditingController();

  bool isSendData = false;
  bool isSearch = false;
  @override
  void onInit() {
    super.onInit();
    getAllServices();
  }

  void setSearchValue({required bool value}) {
    isSearch = value;
    update();
  }

  Future<void> pickImage() async {
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    image = File(file!.path);
    update();
  }


  Future<void> getAllServices() async {
    Stream<QuerySnapshot> data = serviceCollection.orderBy("createdAt", descending: true).snapshots();
    data.listen((event) {
      allServices.clear();
      event.docs.forEach((element) {
        ServiceResModel serviceResModel =
        ServiceResModel.fromJson(element.data() as Map<String, dynamic>);
        allServices.add(serviceResModel);
      });
      update();
    });
  }


  Future<void> getSearchServices({required String searchValue}) async {
    searchServices.clear();
    allServices.forEach((element) {
      if (element.serviceName!
          .toLowerCase()
          .contains(searchValue.toLowerCase())) {
        searchServices.add(element);
      }
    });
    update();
  }


  Future<String> sendProfileImage({required String docId}) async {
    try {
      isSendData = true;
      update();
      // Create a reference to the Firebase Storage location
      final storageRef = FirebaseStorage.instance.ref();
      // Define the path in the Storage where you want to save the image
      final imageRef = storageRef.child("servicesImage/$docId.jpg");

      // Upload the file to Firebase Storage

      if (image != null) {
        final uploadTask = imageRef.putFile(image!);

        // Wait for the upload to complete
        final snapshot = await uploadTask;

        // Get the URL of the uploaded file
        final imageUrl = await snapshot.ref.getDownloadURL();

        return imageUrl;
      } else {
        return "";
      }
    } on FirebaseException catch (e) {
      // Handle any errors
      print(e.toString());
      isSendData = false;
      update();
      return "";
    }
  }


  Future<void> sendServiceData() async {
    Map<String, dynamic> empty = {};
    DocumentReference documentReference = await serviceCollection.add(empty);

    String imageUrl = await sendProfileImage(docId: documentReference.id);

    ServiceResModel serviceResModel = ServiceResModel(
        did: documentReference.id,
        serviceName: serviceNameController.text.trim(),
        image: imageUrl,
        createdAt: DateTime.now());
    try {
      await serviceCollection
          .doc(documentReference.id)
          .set(serviceResModel.toJson());
      isSendData = false;
      update();
      Get.back();
    } on FirebaseException catch (e) {
      isSendData = false;
      update();
    }
  }

  Future<void> updateService({required ServiceResModel serviceResModel}) async {
    isSendData = true;
    update();
    if (image != null) {
      String imageUrl =
      await sendProfileImage(docId: serviceResModel.did ?? "");
      serviceResModel.image = imageUrl;
    }
    try {
      await serviceCollection
          .doc(serviceResModel.did)
          .update(serviceResModel.toJson());
      isSendData = false;
      update();
      Get.back();
      showMessege(title: "Success", messege: "Data Updated Successfully");
    } on FirebaseException catch (e) {
      showMessege(title: "Somthing Went Wrong", messege: "Please Try again ");
      isSendData = false;
      update();
    }
  }

}