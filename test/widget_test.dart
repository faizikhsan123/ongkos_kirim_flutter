import 'package:http/http.dart' as http;

void main() async {
  final url = 'https://rajaongkir.komerce.id/api/v1/destination/province';

  final response = await http.get(
    Uri.parse(url), //parase url 
    headers: {"key": "Q83uhfGO932942e09811f078BC1KB3Lm"}, //header untuk api key
  );

  print(response.body);
}
