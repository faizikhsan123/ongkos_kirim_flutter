import 'dart:convert';

import 'package:case_ongkir_getx/app/modules/home/controllers/berat_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/city_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/home_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/kurirController.dart';
import 'package:case_ongkir_getx/app/modules/home/models/Ongkir.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FunctionOngkir extends GetxController {
  //macam macams controller
  final CityController cityC = Get.put(CityController());
  final HomeController homeC = Get.put(HomeController());
  final Kurircontroller kurirC = Get.put(Kurircontroller());
  final ControllerBerat beratC = Get.put(ControllerBerat());

  var ongkir = <Ongkir>[].obs; //untuk menampung data ongkir

  Future<List<Ongkir>> CekOngkir() async {  //untuk menghitung ongkir
   
    try {
      final url =
          'https://rajaongkir.komerce.id/api/v1/calculate/district/domestic-cost'; //url untuk cek ongkir

      final response = await http.post( //method post
        Uri.parse(url),
        body: {   //untuk mengirim data yang kita punya ke api
        
          "origin": "${cityC.idKotaAsalDarivalue.value.toString()}",
          "destination": "${cityC.idKotaTujuanDarivalue.value.toString()}",
          "weight": "${beratC.beratBarang.toString()}",
          "courier": "${kurirC.kurir.value.toString()}",
        },

        headers: {
          "key": "lIpCJXoV4c53a0293d23da868x9tXn3e", //api key
          'Content-Type':
              'application/x-www-form-urlencoded', //untuk mengirimkan data ke api
        },
      );

      // print(response.body); //debugging

      if (response.statusCode == 200) {
        final datakurir = jsonDecode(
          response.body,
        ); //mengubah json string ke bentuk List/Map

        final List dataAkhir =
            datakurir['data']; //dataAkhir nilainya response body namun hanya mengambil bagian data

        ongkir.value = dataAkhir.map((e) => Ongkir.fromJson(e)).toList();
        //ongkir diisi dengan dataAkhir yang sudah di ubah ke bentuk model Ongkir
        //
        return ongkir; //retturn karena kita mau makai datanya
      }

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
