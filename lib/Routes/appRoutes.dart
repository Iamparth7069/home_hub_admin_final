import 'package:get/get.dart';


import '../ui/LoginScreen/screen/loginScreen.dart';
import '../ui/ServiceProviderMenagmentScreen/Screen/ServiceProviderMenagmentScreen.dart';
import '../ui/ServiceProviderMenagmentScreen/servide Provider Profile/ServiceProviderProfile.dart';
import '../ui/Services Screen/screen/ServicesScreen.dart';
import '../ui/SplashScreen/SplashScreen.dart';
import '../ui/drawerScreen/screen/drawerScreen.dart';
import '../ui/offerScreen/screen/OfferScreen.dart';
import '../ui/offerScreen/screen/addOfferScreen.dart';


class Routes {
  static String splashScreen = "/";
  static String loginScreen = "/loginScreen";
  static String servicesScreen = "/ServicesScreen";
  static String serviceProviderMenagementScreen = "/serviceProviderMenagementScreen";
  static String serviceProviderProfileScreen = "/serviceProviderProfileScreen";
  static String drawerScreen = "/drawerScreen";
  static String offerScreen = "/offerScreen";
  static String addOfferScreen = "/addOfferScreen";
  static String checkInternetScreen = "/checkInternetScreen";
  static String paymentRequestScreen = "/paymentRequestScreen";


  static final getPages = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () =>const Loginscreen()),
    GetPage(name: drawerScreen, page: () => const DrawerScreen()),
    GetPage(name: serviceProviderMenagementScreen, page: () =>const ServiceProviderManagmentScreen()),
    GetPage(name: serviceProviderProfileScreen, page: () => const ServiceProviderProfileScreen()),
    GetPage(name: servicesScreen, page: () =>const ServicesScreen()),
    GetPage(name: offerScreen, page: () =>const OfferScreen()),
    GetPage(name: addOfferScreen, page: () =>const AddOfferScreen()),

  ];
}
