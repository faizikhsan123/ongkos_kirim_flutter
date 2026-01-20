import 'package:case_ongkir_getx/app/modules/home/controllers/city_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/home_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/kurirController.dart';
import 'package:case_ongkir_getx/app/modules/home/models/province.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownProvinsi extends StatelessWidget {
  DropdownProvinsi({
    Key? key,
    required this.tipe, 
  }) : super(key: key);

  final String tipe; 

final cityC = Get.find<CityController>();
final homeC = Get.find<HomeController>();
 final kurirC = Get.put(Kurircontroller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownSearch<Province>(
        asyncItems: (String filter) async {
          return homeC.ambilProvinsi();
        },

        itemAsString: (Province p) => "${p.name} (${p.id})",

        onChanged: (Province? value) {
          if (value != null) {
            if (tipe == 'asal') { 
               cityC.isHiddenAsal.value = false;
               cityC.id_kotaAsal.value = value.id; //set id_kotaAsal menjadi value.id 
             
            } else if (tipe == 'tujuan') { 
              cityC.isHiddenTujuan.value = false; 
              cityC.id_kotaTujuan.value = value.id; //set id_kotaTujuan menjadi value.id
          
            }

          
            
          }else if (value == null) { 
            if (tipe == 'asal') { 
              cityC.isHiddenAsal.value = true; 
              cityC.id_kotaAsal.value = 0; //set id_kotaAsal menjadi 0
            } else if (tipe == 'tujuan') { 
              cityC.isHiddenTujuan.value = true; 
              cityC.id_kotaTujuan.value = 0; //set id_kotaTujuan menjadi 0
              
            }

          }
        },

        clearButtonProps: ClearButtonProps(
          isVisible: true,
        ), 

        popupProps: PopupProps.menu(
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: "Cari Provinsi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),

        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: tipe == 'asal'
                ? "Pilih Provinsi Asal"
                : "Pilih Provinsi Tujuan", 
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
