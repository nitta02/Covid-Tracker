import 'dart:convert';

import 'package:covid_tracker_app/Models/worldStatusModel.dart';
import 'package:covid_tracker_app/services/app_url.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<WorldStatusModel> getApi() async {
    var url = AppUrl.apiurl;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return WorldStatusModel.fromJson(json.encode(data));
    } else {
      throw Exception('Error');
    }
  }

//---------------------Coutry Api Services------------

  Future<List<dynamic>> getCountryApi() async {
    var data;
    var url = AppUrl.countryApiUrl;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
