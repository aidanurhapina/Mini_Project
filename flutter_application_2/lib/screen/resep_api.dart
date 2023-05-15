import 'dart:convert';
import 'package:flutter_application_2/screen/resep.dart';
import 'package:http/http.dart' as http;

class ResepApi {

  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {'from': '0', 'size': '20', 'tags': 'under_30_minutes'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '45e491f498mshb49770eed7714b6p1f8124jsn820a6f328abe',
	    'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);

    
    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Resep.resepFromSnapshot(_temp);
  }
}
