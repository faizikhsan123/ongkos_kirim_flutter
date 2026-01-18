import 'dart:convert';
import 'package:case_ongkir_getx/app/modules/home/models/city.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CityController extends GetxController {
  var kota = <City>[].obs;
  var id_kotaAsal = 0.obs;
  var id_kotaTujuan = 0.obs;
  
  RxBool isHiddenAsal = true.obs; 
  RxBool isHiddenTujuan = true.obs; 




  Future<List<City>> ambilkota(String tipe) async { //tambahkan parameter tipe
   final int id = tipe == 'asal' ? id_kotaAsal.value : id_kotaTujuan.value; //jika tipe asal maka ambil id_kotaAsal, jika tipe tujuan maka ambil id_kotaTujuan
    try {
      final url = "https://rajaongkir.komerce.id/api/v1/destination/city/$id"; 

      var response = await http.get(
        Uri.parse(url),
        headers: {"key": "MLTwqSd1af8061b9d90b70a0FDT6g0kV"},
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
