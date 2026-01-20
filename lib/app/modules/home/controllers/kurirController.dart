import 'package:case_ongkir_getx/app/modules/home/controllers/berat_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/city_controller.dart';
import 'package:get/get.dart';

class Kurircontroller extends GetxController {
  RxBool IshiddenButtonOngkir = true.obs; //sembunyikan tombol cek ongkir

  var kurir = ''.obs;

  final BeratC = Get.put(ControllerBerat()); //controller berat
  final KotaC = Get.find<CityController>(); //controller kota
  // final BeratC = Get.find<ControllerBerat>(); //controller berat

  void showButtonOngkir() {
    if (KotaC.id_kotaAsal.value != 0 && //jika kota asal dan tujuan dipilih
        KotaC.id_kotaTujuan.value != 0 &&
        BeratC.beratBarang > 0 && //jika berat barang lebih dari 0
         kurir.value != '') { //jika kurir dipilih
      IshiddenButtonOngkir.value = false; // tampilkan tombol cek ongkir{
           
         }  
     
    
  }
}
