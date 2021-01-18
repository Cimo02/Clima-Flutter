import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    // remember to add https:// or http:// to api calls
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData =
          jsonDecode(data); //TODO: you only need to call jsonDecode() once!!

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
