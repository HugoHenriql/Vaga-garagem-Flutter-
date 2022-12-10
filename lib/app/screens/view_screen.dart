import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/Menu.dart';
import '../controllers/parking_spot_controller.dart';
import '../models/parking_spot_model.dart';
import 'home_screen.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key, required this.objeto}) : super(key: key);

  final ParkingSpotModel objeto;

  @override
  State<ViewPage> createState() => _EditPageState();
}

class _EditPageState extends State<ViewPage> {
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

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Detalhes do registro: ${spotController.text}',
              textAlign: TextAlign.center
          )),
      drawer: Menu(context),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'N° da Vaga',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red),
              ),


              TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  controller: spotController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 32)),
              Text(
                'Placa ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  controller: licenseController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 32)),

              Text(
                'Marca ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  controller: brandController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 32)),
              Text(
                'Modelo ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  controller: modelController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 32)),
              Text(
                'Cor do Automóvel',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  controller: colorController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 32)),
              Text(
                'Dono ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  controller: responsibleController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 32)),
              Text(
                'Lote',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              TextField(
                  enabled: false,
                  textAlign: TextAlign.center,
                  controller: apartmentController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 32)),
              Text(
                'Bloco',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              TextField(
                  enabled: false,
                  cursorColor: Colors.red,
                  textAlign: TextAlign.center,
                  controller: blockController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 32)),
              ElevatedButton(
                  onPressed: () {
                    Get.to(MyHomePage());
                  },
                  child: Text('Volte')
              )
            ]),
      ),
    );
  }
}
