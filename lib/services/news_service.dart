import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  static const String _apiKey = ' '
      ''
      ''
      ''
      '';

  static Future<List<Article>> fetchNewsBySection(String section) async {
    final String url = 'https://api.nytimes.com/svc/topstories/v2/$section.json?api-key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      print('Fetching URL: $url');
      print('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        if (jsonData.containsKey('results')) {
          final List<dynamic> results = jsonData['results'];

          return results
              .map((json) => Article.fromJson(json))
              .where((article) => article.title.isNotEmpty)
              .toList();
        } else {
          throw Exception('Key "results" not found in response.');
        }
      } else {
        throw Exception(
          'Failed to load news for $section. Status code: ${response.statusCode}\nMessage: ${response.body}',
        );
      }
    } catch (e) {
      print('Error fetching news from section "$section": $e');
      return [];
    }
  }
}
