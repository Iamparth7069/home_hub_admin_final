import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import '../../ServiceProviderMenagmentScreen/Screen/ServiceProviderMenagmentScreen.dart';
import '../../Services Screen/screen/ServicesScreen.dart';
import '../../TransectionScreen/screen/transection_Screen.dart';
import '../../homeScreen/screen/homeScreen.dart';
import '../../offerScreen/screen/OfferScreen.dart';
import '../../paymentScreen/screen/payment_request_screen.dart';

class DrawerScreenController extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();
  int screenNo = 0;
  List widgets = [
    const Homescreen(),
    const ServiceProviderManagmentScreen(),
    const ServicesScreen(),
    const OfferScreen(),
    const PaymentRequestScreen(),
    const TransectionScreen(),

  ];

  void setScreenNo(int value) {
    screenNo = value;
    update();
  }
}
