import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:provider/provider.dart';

class FoodItem {
  final String name;
  final String category;
  final double price;

  FoodItem({required this.name, required this.category, required this.price});
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<FoodItem> foodItems = [
    FoodItem(name: 'Aloo Paratha', category: 'main course', price: 40),
    FoodItem(name: 'Gulab Jamun', category: 'dessert', price: 60),
    FoodItem(name: 'Coca Cola', category: 'beverage', price: 20),
  ];

  String selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swiggato - Dashboard'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              DropdownButton<String>(
                value: selectedCategory,
                items: [
                  DropdownMenuItem(
                    child: Text('All'),
                    value: 'all',
                  ),
                  DropdownMenuItem(
                    child: Text('Main Course'),
                    value: 'main course',
                  ),
                  DropdownMenuItem(
                    child: Text('Dessert'),
                    value: 'dessert',
                  ),
                  DropdownMenuItem(
                    child: Text('Beverage'),
                    value: 'beverage',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: Chart(
              data: [
                BarSeries(
                  data: foodItems
                      .where((item) => item.category == selectedCategory || selectedCategory == 'all')
                      .map((item) => Bar(title: item.name, y: item.price))
                      .toList(),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
