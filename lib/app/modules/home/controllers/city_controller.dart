import 'dart:convert';
import 'package:case_ongkir_getx/app/modules/home/models/city.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CityController extends GetxController {
  var kota = <City>[].obs;
  var id_kota = 0.obs; //untuk menangkap id kota
  RxBool isHidden = true.obs; //untuk hide jika provinsi sudah dipilih tampilkan kotanya


  Future<List<City>> ambilkota() async {
    try {
      final url = "https://rajaongkir.komerce.id/api/v1/destination/city/$id_kota"; //

      var response = await http.get(
        Uri.parse(url),
        headers: {"key": "Q83uhfGO932942e09811f078BC1KB3Lm"},
      );

      if (response.statusCode == 200) {
        final datakota = jsonDecode(response.body);

        final List dataAkhir = datakota['data'];

        kota.value = dataAkhir.map((e) => City.fromJson(e)).toList();

        return kota;
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
