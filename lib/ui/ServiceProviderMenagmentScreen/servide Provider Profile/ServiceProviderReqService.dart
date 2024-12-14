
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../constant/repo.dart';
import '../../../models/Response Model/service_provider_req_res_model.dart';


class ServiceProviderReqService {
  static Future<List<ServiceProviderReqResModel>>
  getAllServiceProviderData() async {
    List<ServiceProviderReqResModel> dataList = [];
    QuerySnapshot serviceProviderDataSnapshot = await serviceProviderRequestCollection.get();

    for (var element in serviceProviderDataSnapshot.docs) {
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      ServiceProviderReqResModel service = ServiceProviderReqResModel.formMap(data);
      dataList.add(service);
    }
    return dataList;
  }

  static Future<void> sendServiceProviderData(
      {required ServiceProviderReqResModel serviceProviderReqResModel}) async {
    String uId = serviceProviderReqResModel.Uid ?? "";
    Map<String, dynamic> data = serviceProviderReqResModel.tomap();
    await serviceProviders.doc(uId).set(data);
    data.addAll({"status": "Completed"});
    await serviceProviderRequestCollection
        .doc(serviceProviderReqResModel.Did)
        .update(data);
  }

  static Future<void> rejectServiceProviderRequest(
      {required ServiceProviderReqResModel serviceProviderReqResModel}) async {
    String uId = serviceProviderReqResModel.Uid ?? "";
    String email = serviceProviderReqResModel.email ?? "";
    String password = serviceProviderReqResModel.password ?? "";

    serviceProviderRequestCollection
        .doc(serviceProviderReqResModel.Did)
        .update({"status": "Rejected"});

    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        print(e);
      } else {
        print(e);
      }
    } catch (e) {
      print(e);

    }
  }
}
