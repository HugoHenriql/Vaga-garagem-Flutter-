import 'dart:convert';
import 'package:controle_estacionamento/app/models/parking_spot_list_model.dart';
import 'package:controle_estacionamento/app/models/parking_spot_model.dart';
import 'package:http/http.dart' as http;

class ParkingSpotService {
  String urlGetListGarage = "https://controle-vaga.herokuapp.com/parking-spot";
  dynamic _response;
  String salvar = "https://controle-vaga.herokuapp.com/parking-spot";

  Future<ParkingSpotList> fetchListParking() async {
    _response = await http.get(Uri.parse(urlGetListGarage));


    if (_response.statusCode == 200) {

    List<dynamic> list = json.decode(_response.body);
    return ParkingSpotList.fromJson(list);
    }
    else {
      throw Exception('Failed');
    }
  }

  Future<dynamic> fetchPostGarage(ParkingSpotModel garage) async {

    _response = await http.post(Uri.parse(salvar),body: json.encode(garage.toJson()) ,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return ParkingSpotModel.fromJson(retorno) ;
    } else {
      return false;

    }

  }
}
