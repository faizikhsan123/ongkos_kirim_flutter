import 'package:case_ongkir_getx/app/modules/home/controllers/berat_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/city_controller.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/function_ongkir.dart';
import 'package:case_ongkir_getx/app/modules/home/controllers/kurirController.dart';
import 'package:case_ongkir_getx/app/modules/home/views/widgets/berat.dart';
import 'package:case_ongkir_getx/app/modules/home/views/widgets/city.dart';
import 'package:case_ongkir_getx/app/modules/home/views/widgets/kurir.dart';
import 'package:case_ongkir_getx/app/modules/home/views/widgets/province.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final CityController cityC = Get.put(CityController());
  final HomeController homeC = Get.put(HomeController());
  final Kurircontroller kurirC = Get.put(Kurircontroller()); 
  final ControllerBerat beratC = Get.put(ControllerBerat());

  final FunctionOngkir funcOngkir = Get.put(FunctionOngkir()); //untuk cek ongkir

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ongkos Kirim INdonesia'), centerTitle: true),
      body: SafeArea( //hanya tambakan ini
        child: ListView(
          children: [
            Column(
            children: [
              DropdownProvinsi(tipe: "asal"),
              Obx(
                () => cityC.isHiddenAsal.value == false
                    ? DropdownKota(tipe: 'asal')
                    : Container(),
              ),
              DropdownProvinsi(tipe: "tujuan"),
              Obx(
                () => cityC.isHiddenTujuan.value == false
                    ? DropdownKota(tipe: 'tujuan')
                    : Container(),
              ),
              BeratBarang(),
          
              Kurir(), 
          
              Obx(
              
                () => kurirC.IshiddenButtonOngkir.value == false
                    ? Padding(
                    
                        padding: EdgeInsets.all(11),
                        child: ElevatedButton(
                          onPressed: () async {
                           await funcOngkir.CekOngkir();
                           Get.defaultDialog(
                            title:   '${funcOngkir.ongkir[0].name}', //ini ngambil dari model,
                            content: Column(children: [
                            
                              Text("Asal Kota: ${cityC.nameKotaAsalDarivalue.value}"),
                              Text("Tujuan Kota: ${cityC.nameKotaTujuanDarivalue.value}"),
                              Text("berat barang: ${beratC.beratBarang}  gram"),
          
                              SizedBox(height: 10,),
          
                              Text("jenis pengiriman : ${funcOngkir.ongkir[0].service}"), //ini ngambil dari model,
                              Text("Harga Pengiriman : ${funcOngkir.ongkir[0].cost}"), //ini ngambil dari model,
                              Text("Estimasi Pengiriman : ${funcOngkir.ongkir[0].etd}"), //ini ngambil dari model,
          
                              
                            ],)
                           );
                          },
                          child: Text("cek Ongkir"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 227, 227, 227),
                            fixedSize: Size(Get.width, 20),
                          ),
                        ),
                      )
                    : Container(),
              ),
          
            
            ],
          ),
          ],
          
          
        ),
      ),
    );
  }
}
