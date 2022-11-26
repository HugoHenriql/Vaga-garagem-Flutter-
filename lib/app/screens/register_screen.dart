import 'package:controle_estacionamento/app/controllers/parking_spot_controller.dart';
import 'package:controle_estacionamento/app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../models/parking_spot_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {

  @override
  void initState() {
    super.initState();
    // controller.listParkSpot();
  }
  TextEditingController spotController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController responsibleController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController blockController = TextEditingController();

  var controller = ParkingSpotController.parkingSpotController;


  Future save() async {

    ParkingSpotModel parkingSpot = ParkingSpotModel(
        "",
        spotController.text,
        licenseController.text,
        brandController.text,
        modelController.text,
        colorController.text,
        "",
        responsibleController.text,
        apartmentController.text,
        blockController.text);


    var response =  await controller.post(parkingSpot);
    print(spotController.text);

    if(response != false){

      Get.snackbar(
        "Sucesso",
        "Salvo com Sucesso",
        icon: Icon(Icons.check, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
      );
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyHomePage()), (Route<dynamic> route) => false);

    }else{
      Get.snackbar(
          "Houve um erro",
          "Deu ruim",
          icon: Icon(Icons.error, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          //   borderColor: Colors.blue
          colorText: Colors.white
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    //  print(widget.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Estacionar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 100,bottom: 100,left: 18,right: 18),
          child: Container(
            height: 550,
          width: 400,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white38,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 300,
                decoration: BoxDecoration(boxShadow: [
                ]),
                child: TextField(
                  controller:spotController ,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit_road_sharp),
                      labelText: 'Vaga',
                      hintText: 'Informe a vaga do estacionamento',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                width: 300,
                decoration: BoxDecoration(boxShadow: [
                ]),
                child: TextField(
                  controller: licenseController,

                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.card_membership),
                      labelText: 'Placa',
                    hintText: 'Informe a placa do carro'
                  ),
                )
            ),
            Container(
                width: 300,
                decoration: BoxDecoration(boxShadow: [
                ]),
                child: TextField(
                  controller: brandController,

                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.car_repair),
                      labelText: 'Carro',
                      hintText: 'Informe o nome do carro',
                  ),
                )
            ),
            Container(
                width: 300,
                decoration: BoxDecoration(boxShadow: [
                ]),
                child: TextField(
                  controller: modelController,

                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.model_training),
                      labelText: 'Modelo do Carro',
                      hintText: 'Informe a modelo do carro'
                  ),
                )
            ),
            Container(
                width: 300,
                decoration: BoxDecoration(boxShadow: [
                ]),
                child: TextField(
                  controller: colorController,

                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.color_lens),
                      labelText: 'Cor do Carro',
                      hintText: 'Informe a cor do carro'
                  ),
                )
            ),
            Container(
                width: 300,
                decoration: BoxDecoration(boxShadow: [
                ]),
                child: TextField(
                  controller: responsibleController,

                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Responsável',
                      hintText: 'Informe o nome do responsável'
                  ),
                )
            ),
            Container(
                width: 300,
                decoration: BoxDecoration(boxShadow: [
                ]),
                child: TextField(
                  controller: apartmentController,

                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.apartment),
                      labelText: 'Endereço',
                      hintText: 'Informe seu endereço'
                  ),
                )
            ),
            Container(
                width: 300,
                padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(boxShadow: [
                ]),
                child: TextField(
                  controller: blockController,

                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.maps_ugc),
                      labelText: 'Complemento',
                    hintText: 'Informe o complemento (se houver)'
                  ),
                )
            ),

            SizedBox(

              width: 100,
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green
                  ),
                  onPressed:save, child: Text('Cadastrar',                              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              )
              )),
            ),
          ],
        ),
      ),
    ),
    ),
    );

  }
  }
