import 'package:controle_estacionamento/app/controllers/parking_spot_controller.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ListCurrenciesController>(() => ListCurrenciesController());
    // Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<ParkingSpotController>(() => ParkingSpotController());
  }
}
