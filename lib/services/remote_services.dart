import 'package:flutter_first/models/exchange.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<Exchange?> getExchanges() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://api.cryptorank.io/v1/exchanges?api_key=0f99ab09211b680792182b75d11d3e16e76897f4a12f2b6c205caae5354d');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return exchangeFromJson(json);
    }
    return null;
  }
}
