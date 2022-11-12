import 'dart:convert';
import 'package:controle_estacionamento/app/models/parking_spot_list_model.dart';
import 'package:http/http.dart' as http;

class ParkingSpotService {
  String urlGetListGarage = "https://controle-vaga.herokuapp.com/parking-spot";
  dynamic _response;

  Future<ParkingSpotList> fetchListParking() async {
    _response = await http.get(Uri.parse(urlGetListGarage));

    if (_response.statusCode == 200) {
      // Map<String, dynamic> retorno = json.decode(_response.body);
      // return Cotacao.fromJson(retorno["BRL"]);
    // } else {
    //   throw Exception('Failed to load cote');
    List<dynamic> list = json.decode(_response.body);
    return ParkingSpotList.fromJson(list);
    }
    else {
      throw Exception('Failed');
    }
  }

  // Future<ListCurrencies> fetchListCurrencies() async {
  //   _response = await http.get(Uri.parse(url));
  //   if (_response.statusCode == 200) {
  //     Map<String, dynamic> retorno = json.decode(_response.body);
  //     return ListCurrencies.fromJson(retorno);
  //   } else {
  //     throw Exception('Failed to load cote');
  //   }
  // }
}
