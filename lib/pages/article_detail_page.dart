// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../models/article.dart';
//
// class ArticleDetailPage extends StatelessWidget {
//   final Article article;
//
//   const ArticleDetailPage({super.key, required this.article});
//
//   // Function to launch the article URL
//   Future<void> _launchURL(BuildContext context) async {
//     final String? url = article.url;
//
//     if (url != null && url.isNotEmpty) {
//       final Uri uri = Uri.parse(url);
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Could not open the article.')),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Article URL is not available.')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     const double imageHeight = 260;
//
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               Hero(
//                 tag: article.title,
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(24),
//                     bottomRight: Radius.circular(24),
//                   ),
//                   child: article.imageUrl.isNotEmpty
//                       ? Image.network(
//                     article.imageUrl,
//                     height: imageHeight,
//                     width: screenWidth,
//                     fit: BoxFit.cover,
//                     errorBuilder: (_, __, ___) => Container(
//                       height: imageHeight,
//                       width: screenWidth,
//                       color: Colors.grey[400],
//                       child: const Icon(Icons.broken_image, size: 80),
//                     ),
//                   )
//                       : Container(
//                     height: imageHeight,
//                     width: screenWidth,
//                     color: Colors.grey[300],
//                     child: const Icon(Icons.image, size: 80),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 40,
//                 left: 12,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.black54,
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.white),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: ListView(
//                 children: [
//                   Text(
//                     article.title,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     children: [
//                       const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
//                       const SizedBox(width: 6),
//                       Text(
//                         article.publishedAt,
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   Row(
//                     children: [
//                       const Icon(Icons.person, size: 16, color: Colors.grey),
//                       const SizedBox(width: 6),
//                       Text(
//                         article.author.isNotEmpty ? article.author : "Unknown Author",
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                   const Divider(height: 30, thickness: 1),
//                   Text(
//                     article.description.isNotEmpty
//                         ? '${article.description * 3}'
//                         : 'No description available.',
//                     style: const TextStyle(fontSize: 16, height: 1.6),
//                   ),
//                   const SizedBox(height: 24),
//                   ElevatedButton.icon(
//                     onPressed: () => _launchURL(context),
//                     icon: const Icon(Icons.open_in_new),
//                     label: const Text('Read Full Article'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.indigo,
//                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  // Updated function to launch the article URL
  Future<void> _launchURL(BuildContext context) async {
    final String? url = article.url;

    if (url != null && url.isNotEmpty) {
      final Uri uri = Uri.tryParse(url)!;

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the article URL.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Article URL is missing or invalid.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double imageHeight = 260;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: article.title,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: article.imageUrl.isNotEmpty
                      ? Image.network(
                    article.imageUrl,
                    height: imageHeight,
                    width: screenWidth,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: imageHeight,
                      width: screenWidth,
                      color: Colors.grey[400],
                      child: const Icon(Icons.broken_image, size: 80),
                    ),
                  )
                      : Container(
                    height: imageHeight,
                    width: screenWidth,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 80),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        article.publishedAt,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        article.author.isNotEmpty ? article.author : "Unknown Author",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(height: 30, thickness: 1),
                  Text(
                    article.description.isNotEmpty
                        ? '${article.description * 3}'
                        : 'No description available.',
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => _launchURL(context),
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('Read Full Article'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
