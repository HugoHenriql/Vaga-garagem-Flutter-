import 'package:controle_estacionamento/app/components/Menu.dart';
import 'package:controle_estacionamento/app/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/parking_spot_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
    print(controller.listParkSpot());
  }
  void _incrementCounter() {
    setState(() {

      _counter  ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text('Veículos Estacionados'),
        ),
        drawer: Menu(context),
        floatingActionButton: FloatingActionButton(
          onPressed:
            Get.to(const RegisterPage());

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
              padding: const EdgeInsets.all(8),
              itemCount: controller.listParkingSpotObs.length,
              itemBuilder: (BuildContext context, int index) {
                return

                  Card(
                    child:
                    Text(controller.listParkingSpotObs[index].modelCar),
                  );
              }),

        )
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}