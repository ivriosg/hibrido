import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hibrido/src/models/page_model.dart';

class PageProvider {
  String _url = 'hibrido.pro';
  String _fields = 'title, content';
  // String _homepage = '91';

  Future<List<Page>> _response(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final page = new Pages.fromJsonList(decodedData);
    return page.items;
  }

  // Get content from Home Page
  Future<List<Page>> getHomePage() async {
    final url = Uri.https(_url, 'wp-json/wp/v2/pages', {
      '_fields': _fields,
    });

    return await _response(url);
  }
}
