import 'package:flutter/material.dart';
import 'package:bookmanagement/pages/home.dart';
import 'package:bookmanagement/pages/search.dart';
import 'package:bookmanagement/pages/delete.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for the books
    final List<Map<String, dynamic>> books = [
      {
        'name': 'Flutter Development',
        'author': 'Jane Doe',
        'price': '19.99',
      },
      {
        'name': 'Dart for Beginners',
        'author': 'John Doe',
        'price': '14.99',
      },
      {
        'name': 'Advanced Flutter',
        'author': 'Emily Smith',
        'price': '24.99',
      },
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            color: Color(0xFFF1F8E9), // Light green card background
            child: ListTile(
              title: Text(books[index]['name'], style: TextStyle(color: Color(0xFF2C7865))),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Author: ${books[index]['author']}", style: TextStyle(color: Color(0xFF2C7865))),
                  Text("Price: \$${books[index]['price']}", style: TextStyle(color: Color(0xFF2C7865))),
                ],
              ),
              trailing: Icon(Icons.edit, color: Color(0xFF2C7865)),
            ),
            elevation: 5,
          );
        },
      ),
    );
  }
}
