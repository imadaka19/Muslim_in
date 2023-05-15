import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String response;

  PostResult({required this.response});

  static Future<Object> connectToAPI(String text) async {
    Uri apiURL = Uri.parse("http://35.240.172.218/predict");

    try {
      var header = {'Content-Type': 'application/json'};

      var apiResult = await http.post(apiURL,
          headers: header, body: jsonEncode({'text': text}));

      var jsonObject = json.decode(apiResult.body);
      if (apiResult != null) {
        print(jsonObject);
        return jsonObject["response"].toString();
      }
      return "Something went wrong";
    } catch (e) {
      return "Bad Response";
      ;
    }
  }

  void dispose() {}
}
