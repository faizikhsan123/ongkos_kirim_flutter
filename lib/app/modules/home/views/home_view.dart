import 'package:case_ongkir_getx/app/modules/home/controllers/city_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/views/widgets/city.dart';
import 'package:case_ongkir_getx/app/modules/home/views/widgets/province.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final CityController cityC = Get.put(CityController());
  final HomeController homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Column(
        children: [
          DropdownProvinsi(
            tipe: "asal",
          ), //memannggil constructor tipe dan nilainya  =asal
          Obx(
            () => cityC.isHiddenAsal.value == false
                ? DropdownKota(tipe: 'asal') //kotaa asal
                : Container(),
          ),
          DropdownProvinsi(
            tipe: "tujuan",
          ), //memannggil constructor tipe dan nilainya  =tujuan
          Obx(
            () => cityC.isHiddenTujuan.value == false
                ? DropdownKota(tipe: 'tujuan') //kotaa tujuan
                : Container(),
          ),
        ],
      ),
    );
  }
}
