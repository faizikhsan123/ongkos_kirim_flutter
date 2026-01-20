
import 'package:case_ongkir_getx/app/modules/home/controllers/city_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/kurirController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Kurir extends StatelessWidget {
  final kurirC = Get.find<Kurircontroller>(); //controller kurir
  final KotaC = Get.find<CityController>(); //controller kota


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(18),
      child: DropdownSearch<Map<String, dynamic>>(
        //widget dropdownsearch items berbentuk mapping
        popupProps: PopupProps.menu(),

        items: [
          //items berbentuk mapping
          {"code": "jne", "name": "Jalur Nugrraha ekakurir"},
          {"code": "tiki", "name": "TITIPAN KILAT"},
          {"code": "pos", "name": "perusahaan opsional surat"},
        ],

        itemAsString: (Map<String, dynamic> value) =>
            "${value['name']}", //jadi itemsnya awwalnya kan map (diatas) terus kita ubah ke bentuk stringq

        clearButtonProps: ClearButtonProps(isVisible: true),

        onChanged: (value) {
         if (value != null) {
          kurirC.kurir.value = value['code']; //var kurir diambil dari map dari key code
          kurirC.showButtonOngkir(); //jalankan function validasi yg ada di kurircontroller
         }else if (value == null) { //jika tombol clear ditekan 
           kurirC.kurir.value = '';
           kurirC..IshiddenButtonOngkir.value = true;
         }
        },

        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: " Kurir",
            labelText: "Pilih Kurir",
          ),
        ),
      ),
    );
  }
}
