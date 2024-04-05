import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Card(
                margin: EdgeInsets.all(10),
                color: Color(0xFFF1F8E9), // Light green card background
                child: ListTile(
                  title: Text(data['name'], style: TextStyle(color: Color(0xFF2C7865))),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Age: ${data['age']}", style: TextStyle(color: Color(0xFF2C7865))),
                      Text("Email: ${data['email']}", style: TextStyle(color: Color(0xFF2C7865))),
                      Text("Course: ${data['course']}", style: TextStyle(color: Color(0xFF2C7865))),
                      Text("ID: ${data['id']}", style: TextStyle(color: Color(0xFF2C7865))),
                    ],
                  ),
                  trailing: Icon(Icons.edit, color: Color(0xFF2C7865)), // Placeholder for edit icon, implement functionality as needed
                ),
                elevation: 5,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
