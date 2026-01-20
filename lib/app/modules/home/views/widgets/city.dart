import 'package:case_ongkir_getx/app/modules/home/controllers/city_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/home_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/models/city.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownKota extends StatelessWidget {
  DropdownKota({Key? key, required this.tipe})
    : super(key: key); //menambahkan constructor tipe

  final String tipe; //menambahkan variabel tipe

  final cityC = Get.find<CityController>();
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownSearch<City>(
        asyncItems: (String filter) async {
          return cityC.ambilkota(tipe);
        },

        itemAsString: (City p) => "${p.name} (${p.id})",

        onChanged: (City? value) {
          if (value != null) {
            if (tipe == 'asal') { 
             cityC.idKotaAsalDarivalue.value = value.id; //ini untuk menangkap dari id kotaasal yg dipilih
             cityC.nameKotaAsalDarivalue.value = value.name; //ini untuk menangkap dari name kotaasal yg dipilih

            }
            if (tipe == 'tujuan') { 
             cityC.idKotaTujuanDarivalue.value = value.id; //ini untuk menangkap dari id kotatujuan yg dipilih
             cityC.nameKotaTujuanDarivalue.value = value.name; //ini untuk menangkap dari name kotatujuan yg dipilih
            
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
              hintText: "Cari Kota",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),

        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: tipe == 'asal'
                ? 'Kota Asal'
                : 'Kota Tujuan', 
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
