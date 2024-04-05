import 'package:flutter/material.dart';
import 'package:bookmanagement/pages/home.dart';
import 'package:bookmanagement/pages/search.dart';
import 'package:bookmanagement/pages/delete.dart';


class DeletePage extends StatefulWidget {
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter User ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Search'),
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF2C7865)),
                  ),
                ],
              ),
            ),
            // Dummy result card
            Card(
              color: Color(0xFFF1F8E9),
              child: ListTile(
                title: Text('Dummy User', style: TextStyle(color: Color(0xFF2C7865))),
                subtitle: Text("ID: 12345", style: TextStyle(color: Color(0xFF2C7865))),
                trailing: Icon(Icons.delete, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Delete'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
