import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_relise_app/models/bundles.dart';

class BundlesListRepository {
  Future getbundles() async {
    List<Bundles> result = [];
    var response = await http.get(Uri.parse(
        "https://korgar.tj/avera-api/priceslist?key=sd34lfkjsdklf@1234234DKFJS634DK@*\$%5Evmklsdfjlks234df"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      List bundles = data["data"]["bundles"];
      result = bundles.map((elem) => Bundles.fromJson(elem)).toList();
      return result;
    }
  }
}
