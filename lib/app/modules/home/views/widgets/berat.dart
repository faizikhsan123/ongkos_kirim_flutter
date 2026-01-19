import 'package:case_ongkir_getx/app/modules/home/controllers/berat_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeratBarang extends StatelessWidget {
  // inject controller
  final BeratC = Get.put(ControllerBerat());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // =========================
          // INPUT ANGKA BERAT
          // =========================
          Expanded(
            flex: 2,
            child: TextField(
              controller: BeratC.berat,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukkan Berat Barang",
              ),

              // DIPANGGIL SETIAP USER MENGETIK ANGKA
              onChanged: (value) => BeratC.ubahBerat(value),
            ),
          ),

          const SizedBox(width: 9),


          // =========================
          // DROPDOWN SATUAN
          // =========================
          Expanded(
            flex: 1,
            child: DropdownSearch<String>(
              items:  [
                "ton",      // 1 ton = 1.000.000 gram
                "Kwintal",  // 1 kwintal = 100.000 gram
                "ons",      // 1 ons = 100 gram
                "lbs",      // 1 lbs = 453.592 gram
                "pound",    // sama dengan lbs
                "kg",       // 1 kg = 1.000 gram
                "hg",       // 100 gram
                "dag",      // 10 gram
                "gram",     // 1 gram
                "dg",       // 0.1 gram
                "cg",       // 0.01 gram
                "mg",       // 0.001 gram
              ],

              // satuan awal
              selectedItem: "gram",

              // DIPANGGIL SAAT USER GANTI SATUAN
              onChanged: (value) {
                if (value != null) {
                  BeratC.ubahSatuan(value);
                }
              },

              dropdownDecoratorProps:  DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Satuan",
                ),
              ),

              popupProps:  PopupProps.bottomSheet(
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    hintText: "Cari Satuan",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
