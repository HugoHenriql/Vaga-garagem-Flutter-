import 'package:controle_estacionamento/app/screens/register_screen.dart';
import 'package:controle_estacionamento/app/screens/view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../components/Menu.dart';
import '../controllers/parking_spot_controller.dart';
import 'edit_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
    controller.listParkingSpot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Veiculos Estacionados', textAlign: TextAlign.center)
        ),
        drawer: Menu(context),
        floatingActionButton: FloatingActionButton(
          onPressed:() {
          Get.to(const RegisterPage());},
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
        body:
        Obx(() =>
        controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            :
        Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: controller.listParkingSpotObs.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ViewPage(objeto: controller.listParkingSpotObs[index]));
                    },
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.directions_car),
                            title: Text('Veículo: ${controller.listParkingSpotObs[index].brandCar}'),
                            subtitle: Text('Placa: ${controller.listParkingSpotObs[index].licensePlateCar}'),
                            iconColor: Colors.green,
                            contentPadding: EdgeInsets.all(10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.edit),
                                color: Colors.blue,
                                onPressed: () {
                                  Get.to(EditPage(objeto: controller.listParkingSpotObs[index]));
                                },
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  controller.deleteParkingSpot(controller.listParkingSpotObs[index]);
                                },
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
              }),
        )
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}