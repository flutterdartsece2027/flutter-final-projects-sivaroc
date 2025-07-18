// // Updated Article model
// class Article {
//   final String title;
//   final String description;
//   final String content;
//   final String section;
//   final String subsection;
//   final String imageUrl;
//   final String publishedAt;
//   final String author;
//   final String? url;
//
//   Article({
//     required this.title,
//     required this.description,
//     required this.content,
//     required this.section,
//     required this.subsection,
//     required this.imageUrl,
//     required this.publishedAt,
//     required this.author,
//     this.url,
//   });
//
//   factory Article.fromJson(Map<String, dynamic> json) {
//     return Article(
//       title: json['title'] ?? '',
//       description: json['abstract'] ?? '',
//       content: json['caption'] ?? json['abstract'] ?? '',
//       section: json['section'] ?? '',
//       subsection: json['subsection'] ?? '',
//       imageUrl: (json['multimedia'] != null &&
//           json['multimedia'] is List &&
//           json['multimedia'].isNotEmpty)
//           ? json['multimedia'][0]['url']
//           : '',
//       publishedAt: json['published_date'] ?? '',
//       author: json['byline'] ?? 'Unknown',
//       url: json['url'],
//     );
//   }
// }
//


class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String publishedAt;
  final String author;
  final String url;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.author,
    required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['abstract'] ?? '',
      imageUrl: (json['multimedia'] != null && json['multimedia'].isNotEmpty)
          ? json['multimedia'][0]['url']
          : '',
      publishedAt: json['published_date'] ?? '',
      author: json['byline'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
