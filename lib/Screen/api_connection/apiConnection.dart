import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Food {
  final String name;
  final String category;
  final String imageUrl;
  Food({required this.name, required this.category, required this.imageUrl});
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['strMeal'],
      category: json['strCategory'],
      imageUrl: json['strMealThumb'],
    );
  }
}
class FoodsScreen extends StatefulWidget {
  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}
class _FoodsScreenState extends State<FoodsScreen> {
  List<Food> foods = [];
  @override
  void initState() {
    super.initState();
    fetchFoods().then((data) {
      setState(() {
        foods = data;
      });
    });
  }

  Future<List<Food>> fetchFoods() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s='));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<dynamic> meals = jsonData['meals'];
      List<Food> foods = [];
      for (var item in meals) {
        var food = Food.fromJson(item);
        foods.add(food);
      }
      return foods;
    } else {
      throw Exception('Failed to fetch foods');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(
                    foods[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foods[index].name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        foods[index].category,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
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