import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_relise_app/models/pricelist.dart';

abstract interface class IPricelistrepo {
  Future<List<Pricelist>> getPriseList();
}

// @Deprecated("Badi du moh ubrat meknemsha")
class Priselistrepository implements IPricelistrepo {
  @override
  Future<List<Pricelist>> getPriseList() async {
    List<Pricelist> result = [];
    try {
      var response = await http.get(Uri.parse(
          "https://korgar.tj/avera-api/priceslist?key=sd34lfkjsdklf@1234234DKFJS634DK@*\$%5Evmklsdfjlks234df"));
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        List pricelist = json["data"]["pricelist"];
        result =
            pricelist.map((element) => Pricelist.fromJson(element)).toList();
      }
    } catch (e) {
      print(e);
    }
    return result;
  }
}

class CSharpBacken implements IPricelistrepo {
  @override
  Future<List<Pricelist>> getPriseList() async {
    return [];
  }
}
