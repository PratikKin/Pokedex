import 'dart:convert';

import 'package:http/http.dart' as http;

class PokeInfo {
  final String apiUrl = "https://pokedex2.p.rapidapi.com/pokedex/uk/";
  final Map<String, String> headers = {
    'X-RapidAPI-Key': "1bf2a45a7emsh7beed4d14953c2ap13d6f1jsn20877618f787",
    'X-RapidAPI-Host': 'pokedex2.p.rapidapi.com',
  };

  Future<List<dynamic>> getAvailablePokemonInfo() async {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData is List<dynamic>) {
        return jsonData;
      } else {
        throw Exception('API response is not a JSON array');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> getSpecificPokemonInfo(String num) async {
    final response = await http.get(Uri.parse(apiUrl + num), headers: headers);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if (jsonData is List<dynamic>) {
        return jsonData;
      } else {
        throw Exception('API response is not a JSON array');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
