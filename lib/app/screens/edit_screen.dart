import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../components/Menu.dart';
import '../controllers/parking_spot_controller.dart';
import '../models/parking_spot_model.dart';
import 'home_screen.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key, required this.objeto}) : super(key: key);

  final ParkingSpotModel objeto;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var controller = ParkingSpotController.parkingSpotController;

  TextEditingController spotController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController responsibleController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController blockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    spotController.text = widget.objeto.parkingSpotNumber;
    licenseController.text = widget.objeto.licensePlateCar;
    brandController.text = widget.objeto.brandCar;
    modelController.text = widget.objeto.modelCar;
    colorController.text = widget.objeto.colorCar;
    responsibleController.text = widget.objeto.responsibleName;
    apartmentController.text = widget.objeto.apartment;
    blockController.text = widget.objeto.block;
  }

  Future save() async {
    ParkingSpotModel parkingSpot = ParkingSpotModel(
        widget.objeto.id,
        spotController.text,
        licenseController.text,
        brandController.text,
        modelController.text,
        colorController.text,
        "",
        responsibleController.text,
        apartmentController.text,
        blockController.text);

    var response = await controller.editParkingSpot(parkingSpot);

    if (response != false) {
      Get.to(const MyHomePage());
      Get.snackbar(
        "Sucesso",
        "Salvo com Sucesso",
        icon: Icon(Icons.check, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar("Houve um erro", "Deu ruim",
          icon: Icon(Icons.error, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          //   borderColor: Colors.blue
          colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Editar registro: ${spotController.text}',
              textAlign: TextAlign.center)),
      drawer: Menu(context),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Container(
              width: 300,
              decoration: BoxDecoration(boxShadow: []),
              child: TextField(
                controller: spotController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit_road_sharp),
                  labelText: 'Vaga',
                  hintText: 'Informe a vaga do estacionamento',
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
              width: 300,
              decoration: BoxDecoration(boxShadow: []),
              child: TextField(
                controller: licenseController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.card_membership),
                    labelText: 'Placa',
                    hintText: 'Informe a placa do carro'),
              )),
          Container(
              width: 300,
              decoration: BoxDecoration(boxShadow: []),
              child: TextField(
                controller: brandController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.car_repair),
                  labelText: 'Carro',
                  hintText: 'Informe o nome do carro',
                ),
              )),
          Container(
              width: 300,
              decoration: BoxDecoration(boxShadow: []),
              child: TextField(
                controller: modelController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.model_training),
                    labelText: 'Modelo do Carro',
                    hintText: 'Informe a modelo do carro'),
              )),
          Container(
              width: 300,
              decoration: BoxDecoration(boxShadow: []),
              child: TextField(
                controller: colorController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.color_lens),
                    labelText: 'Cor do Carro',
                    hintText: 'Informe a cor do carro'),
              )),
          Container(
              width: 300,
              decoration: BoxDecoration(boxShadow: []),
              child: TextField(
                controller: responsibleController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Responsável',
                    hintText: 'Informe o nome do responsável'),
              )),
          Container(
              width: 300,
              decoration: BoxDecoration(boxShadow: []),
              child: TextField(
                controller: apartmentController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.apartment),
                    labelText: 'Endereço',
                    hintText: 'Informe seu endereço'),
              )),
          Container(
              width: 300,
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(boxShadow: []),
              child: TextField(
                controller: blockController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.maps_ugc),
                    labelText: 'Complemento',
                    hintText: 'Informe o complemento (se houver)'),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      Get.to(const MyHomePage());
                    },
                    child: Text('Voltar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ))),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 100,
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: save,
                    child: Text('Salvar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ))),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
