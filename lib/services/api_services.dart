import 'dart:convert';

import 'package:covid_tracker_app/Models/worldStatusModel.dart';
import 'package:covid_tracker_app/services/app_url.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<WorldStatusModel> getApi() async {
    var url = AppUrl.apiurl;
    final response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      return WorldStatusModel.fromJson(jsonEncode(data));
    } else {
      throw Exception('Error');
    }
  }
}
