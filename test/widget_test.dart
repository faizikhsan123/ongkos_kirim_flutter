import 'package:http/http.dart' as http;

void main() async {
  final url =
      'https://rajaongkir.komerce.id/api/v1/calculate/district/domestic-cost';

  final response = await http.post(Uri.parse(url), //parase url
    body: {
      //untuk mengirim data
      "origin": "1391",
      "destination": "1376",
      "weight": "1000",
      "courier": "jne",
    },

    headers: {
      "key": "Q83uhfGO932942e09811f078BC1KB3Lm",
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );

  print(response.body);
}
