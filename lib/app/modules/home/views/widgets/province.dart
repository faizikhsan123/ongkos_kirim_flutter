import 'package:case_ongkir_getx/app/modules/home/controllers/city_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/home_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/models/province.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownProvinsi extends StatelessWidget {
  DropdownProvinsi({
    Key? key,
    required this.tipe, //menambahkan constructor tipe
  }) : super(key: key);

  final String tipe; //menambahkan variabel tipe

final cityC = Get.find<CityController>();
final homeC = Get.find<HomeController>();

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
            if (tipe == 'asal') { //jikka tipenya asal
              cityC.isHiddenAsal.value = false; //menampilkan dropdown kota asal
              cityC.id_kotaAsal.value = value.id; //menyimpan id kota asal
            } else if (tipe == 'tujuan') { //jika tipenya tujuan
              cityC.isHiddenTujuan.value = false; //menampilkan dropdown kota tujuan
              cityC.id_kotaTujuan.value = value.id; //menyimpan id kota tujuan
            }
          }else if (value == null) { //jika tombol clear X  ditekan
            if (tipe == 'asal') { //jika tipenya asal
              cityC.isHiddenAsal.value = true; //menyembunyikan dropdown kota asal
            } else if (tipe == 'tujuan') { //jika tipenya tujuan
              cityC.isHiddenTujuan.value = true; //menyembunyikan dropdown kota asal
              
            }

          }
        },

        clearButtonProps: ClearButtonProps(
          isVisible: true,
        ), //menambahkan tombol clear

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
                : "Pilih Provinsi Tujuan", //jika tipe = asal maka tampilkan "Pilih Provinsi Asal", jika tipe = tujuan maka tampilkan "Pilih Provinsi Tujuan"
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
