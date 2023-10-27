import 'package:flutter/material.dart';
class FavoriteScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteItems;
  FavoriteScreen({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return ListTile(
            leading: Image.asset(
              item['image']!,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item['name']!),
            subtitle: Text('Price: ${item['price']}'),
          );
        },
      ),
    );
  }
}