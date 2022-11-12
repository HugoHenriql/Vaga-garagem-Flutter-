import 'package:controle_estacionamento/app/models/parking_spot_model.dart';
import 'package:controle_estacionamento/app/services/parking_spot_service.dart';
import 'package:get/get.dart';

class ParkingSpotController extends GetxController {
  ParkingSpotService parkingSpotService = ParkingSpotService();
  var isLoading = false.obs;
  var listParkingSpotObs = <ParkingSpotModel>[].obs;

  static ParkingSpotController get parkingSpotController => Get.find();

  Future<dynamic> listParkSpot()  async {
    isLoading.value = true;
    var list = await parkingSpotService.fetchListParking();
    listParkingSpotObs.value = list.listParkingSpot;
    isLoading.value = false;
    update();
    return listParkingSpotObs;
  }


}