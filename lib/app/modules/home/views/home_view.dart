import 'package:case_ongkir_getx/app/modules/home/controllers/city_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/models/city.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../controllers/home_controller.dart';
import '../models/province.dart';

class HomeView extends GetView<HomeController> {
  final cityC = Get.put(CityController()); //memanggil controller city

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownSearch<Province>(
              asyncItems: (String filter) async {
                return controller.ambilProvinsi();
              },

              itemAsString: (Province p) => "${p.name} (${p.id})",

              onChanged: (Province? value) {
                if (value != null) {
                  cityC.isHidden.value = false; //jika provinsi di pilih maka kota akan muncul
                  cityC.id_kota.value = value.id; //mengambil id kota dari provinsi yang dipilih
                }
              },

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
                  hintText: "Pilih Provinsi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),

          Obx(
            //di obx karena kota akan muncul setelah provinsi dipilih ishiddennya di pantau
            () => cityC.isHidden.value == false
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: DropdownSearch<City>(  //membuat dropdown kota
                      asyncItems: (String filter) async {
                        return cityC.ambilkota(); //
                      },

                      itemAsString: (City p) => "${p.name} (${p.id})", //menampilkan nama kota dan id

                      onChanged: (City? value) {
                        if (value != null) {}
                      },

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
                          hintText: "Pilih Kota",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(), //jika ishidden true maka dropdown kota tidak tampil
          ),
        ],
      ),
    );
  }
}
