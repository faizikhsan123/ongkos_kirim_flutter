import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerBerat extends GetxController {
  // Dipakai untuk mengambil nilai angka yang diketik user
  late TextEditingController berat;

  


  // nilai default berat barang (SELALU DISIMPAN DALAM GRAM)
  double beratBarang = 0.0;

  // set default satuan yaitu gram
  String satuan = 'gram';

  // =========================
  // DIPANGGIL SAAT USER MENGETIK ANGKA
  // =========================
  void ubahBerat(String value) {
    // Mengambil angka mentah dari TextField
    // Contoh: user mengetik "2"
    double input = double.tryParse(value) ?? 0;

    // Konversi angka ke GRAM berdasarkan satuan aktif
    switch (satuan) {
      case "ton":
        beratBarang = input * 1000000; // ton → gram
        break;

      case "Kwintal":
        beratBarang = input * 100000; // kwintal → gram
        break;

      case "ons":
        beratBarang = input * 100; // ons → gram
        break;

      case "lbs":
      case "pound":
        beratBarang = input * 453.592; // pound/lbs → gram
        break;

      case "kg":
        beratBarang = input * 1000; // kg → gram
        break;

      case "hg":
        beratBarang = input * 100; // hektogram → gram
        break;

      case "dag":
        beratBarang = input * 10; // dekagram → gram
        break;

      case "gram":
        beratBarang = input * 1; // gram → gram
        break;

      case "dg":
        beratBarang = input * 0.1; // desigram → gram
        break;

      case "cg":
        beratBarang = input * 0.01; // sentigram → gram
        break;

      case "mg":
        beratBarang = input * 0.001; // miligram → gram
        break;

      default:
        beratBarang = 0;
    }

    // Debug: melihat berat akhir dalam gram
    print("berat (gram): $beratBarang");
  }

  // =========================
  // DIPANGGIL SAAT USER GANTI SATUAN
  // =========================
  void ubahSatuan(String value) {
    // HANYA mengubah satuan aktif

    satuan = value; //value ini yg dipilih dari satuan dropdown

    // Ambil ulang angka di TextField supaya konsisten
    ubahBerat(berat.text);

    // Debug
    print("satuan berubah ke: $satuan");
    print("berat (gram): $beratBarang");
  }

  @override
  void onInit() {
    // Mengisi TextField pertama kali dengan nilai awal beratBarang
    berat = TextEditingController(text: "$beratBarang");
    super.onInit();
  }

  @override
  void dispose() {
    // Membersihkan controller agar tidak memory leak
    berat.dispose();
    super.dispose();
  }
}
