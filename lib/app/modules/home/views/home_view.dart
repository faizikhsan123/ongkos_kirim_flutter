import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../controllers/home_controller.dart';
import '../models/province.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownSearch<Province>(
          // ini untuk menamgail controller yang menjalankan fungsi ambilProvinsi
          asyncItems: (String filter) async {
            return controller.ambilProvinsi();
          },

          // ⬇️ teks yang ditampilkan diambil dari model Province 
         itemAsString: (Province p) => "${p.name} (${p.id})",


          // ⬇️ menangkap nilai terpilih
          onChanged: (Province? value) {
            if (value != null) {
              print("ID: ${value.id}");
              print("Nama: ${value.name}");
            }
          },

          // ⬇️ tampilan popup
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

          // ⬇️ tampilan field dropdown
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
    );
  }
}
