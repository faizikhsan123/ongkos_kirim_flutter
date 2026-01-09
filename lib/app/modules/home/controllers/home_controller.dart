import 'dart:convert';

import 'package:case_ongkir_getx/app/modules/home/models/province.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var provinsi = <Province>[].obs;

  @override
  void onInit() {
    //ketika pertama kali controller dijalankan jalakna fungsi ini
    super.onInit();
  }

  Future<List<Province>> ambilProvinsi() async {
    try {
      final url =
          "https://rajaongkir.komerce.id/api/v1/destination/province"; //url raja ongkir provinsi

      var response = await http.get(
        //var untuk http get
        Uri.parse(url),
        headers: {
          "key": "Q83uhfGO932942e09811f078BC1KB3Lm",
        }, //header untuk api key(butuh di api raja ongkir)
      );

      if (response.statusCode == 200) {
        //jika statusnya berhasil
        final dataProvinsi = jsonDecode(
          response.body,
        ); //mengubah json string ke bentuk List/Map
        print(dataProvinsi); //mka hasilnya seperti dibawah

        //karena struktur jsonnya seperti ini
        //{"meta":{"message":"Success Get Province","code":200,"status":"success"},"data":[{"id":1,"name":"NUSA TENGGARA BARAT (NTB)"},{"id":2,"name":"MALUKU"},

        //maka kita ambil bagian datanya saja yang dimana itu bentuk list []
        final List dataAkhir = dataProvinsi['data'];

        //dataAkhir adalah data hasil dari API yang masih berbentuk list biasa berisi map,
        //misalnya [{id: 1, name: "Aceh"}, {id: 2, name: "Sumatera Utara"}].

        // API → karung beras
        // map() → mengambil beras satu-satu
        // toList() → memasukkan beras ke karung baru

        provinsi.value = dataAkhir.map((e) => Province.fromJson(e)).toList();

        return provinsi;
      }
      //jika statusnya bukan 200 / failed return array kosong
      return [];
    } catch (e) {
      // ⬇️ WAJIB return
      return [];
    }
  }
}
