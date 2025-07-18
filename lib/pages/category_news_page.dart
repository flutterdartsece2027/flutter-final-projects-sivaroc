import 'package:flutter/material.dart';
import '../models/article.dart';

class CategoryNewsPage extends StatelessWidget {
  final String category;
  final List<Article> articles;

  const CategoryNewsPage({
    super.key,
    required this.category,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = articles.where((a) =>
    a.title.toLowerCase().contains(category.toLowerCase()) ||
        a.description.toLowerCase().contains(category.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(title: Text('$category News')),
      body: filtered.isEmpty
          ? const Center(child: Text('No articles found for this category.'))
          : ListView.builder(
        itemCount: filtered.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final article = filtered[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: article.imageUrl.isNotEmpty
                      ? Image.network(
                    article.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.broken_image, size: 60),
                  )
                      : Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          article.publishedAt,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
