import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback onTap;

  const ArticleCard({
    super.key,
    required this.title,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.article, size: 40, color: Colors.blue),
      title: Text(title),
      subtitle: Text(date),
      onTap: onTap,
    );
  }
}
