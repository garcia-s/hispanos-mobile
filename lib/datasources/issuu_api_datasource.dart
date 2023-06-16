import 'package:http/http.dart' as http;
import 'dart:convert';

const String _baseUrl =
    'https://issuu.com/call/document-page/document-download/hispanosemprendedores';

class IssuuApiDataSource {
  Future<String> getMagazine(String id) async {
    try {
      final Uri url = Uri.parse('$_baseUrl/$id');
      final response = await http.Client().get(url);
      if (response.statusCode != 200) throw UnableToGetDownloadUrl();
      final data = json.decode(response.body) as Map<String, dynamic>;
      final downloadUrl = Uri.parse(data['url']);
      final downloadResponse = await http.Client().get(downloadUrl);
      if (downloadResponse.statusCode != 200) throw DownloadFailed();
      return downloadResponse.body;
    } catch (e) {
      rethrow;
    }
  }
}

class UnableToGetDownloadUrl extends Error {}

class DownloadFailed extends Error {}
