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

  var idKotaAsalDarivalue = 0.obs; //set id_kotaAsal menjadi 0
  var idKotaTujuanDarivalue = 0.obs; // set id_kotaTujuan menjadi 0

  var nameKotaAsalDarivalue = ''.obs; //set nama_kotaAsal menjadi ksoong 
  var nameKotaTujuanDarivalue = ''.obs; //set nama_kotaTujuan menjadi ksoong




  Future<List<City>> ambilkota(String tipe) async { 
   final int id = tipe == 'asal' ? id_kotaAsal.value : id_kotaTujuan.value; 
    try {
      final url = "https://rajaongkir.komerce.id/api/v1/destination/city/$id"; 

      var response = await http.get(
        Uri.parse(url),
        headers: {"key": "lIpCJXoV4c53a0293d23da868x9tXn3e"},
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
