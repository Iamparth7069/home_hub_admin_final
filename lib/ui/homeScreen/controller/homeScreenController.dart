import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  Map<String, dynamic> userData = {};
  bool isLoading = false;
  int totalOrders = 0;
  int totalUsers = 0;
  int totalProviders = 0;
  @override
  onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    try {
      // Set loading state to true and notify listeners
      isLoading = true;
      update();

      // Listen to Orders collection with a condition on 'status'
      FirebaseFirestore.instance
          .collection("Orders")
          .where("status", isNotEqualTo: "Cancel")
          .snapshots()
          .listen((event) {
        totalOrders = event.docs.length;
        update();
      });

      // Listen to User collection
      FirebaseFirestore.instance.collection("User").snapshots().listen((event) {
        totalUsers = event.docs.length;
        update();
      });

      // Listen to service_providers collection
      FirebaseFirestore.instance
          .collection("service_providers")
          .snapshots()
          .listen((event) {
        totalProviders = event.docs.length;
        update();
      });

      FirebaseFirestore.instance
          .collection("Admin")
          .doc("adminData")
          .snapshots()
          .listen((event) {
        userData = event.data() as Map<String, dynamic>? ?? {};
        update();
      });

    } catch (e) {
      // Handle any errors here, possibly by logging or setting an error state
      print("Error retrieving data: $e");
    } finally {
      // Set loading state to false and notify listeners
      isLoading = false;
      update();
    }
  }

}
