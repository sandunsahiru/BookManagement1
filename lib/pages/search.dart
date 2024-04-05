import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final Function(int) onItemTapped; // Callback for handling navigation taps

  SearchPage({required this.onItemTapped});

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
      appBar: AppBar(
        title: Text('Search Books'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            color: Color(0xFFF1F8E9),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Delete'),
        ],
        currentIndex: 1, // Assuming 'Search' is the second item
        onTap: (index) => onItemTapped(index), // Use the provided callback for onTap
      ),
    );
  }
}
