import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeletePage extends StatefulWidget {
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final _formKey = GlobalKey<FormState>();
  String _searchId = '';
  DocumentSnapshot? _searchResult;
  bool _isLoading = false;

  void _searchById() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        var querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: _searchId)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          setState(() {
            _searchResult = querySnapshot.docs.first;
          });
        } else {
          setState(() {
            _searchResult = null;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user found with ID $_searchId')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error searching for user: $e')));
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  void _deleteUserById(String docId) async {
    await FirebaseFirestore.instance.collection('users').doc(docId).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User successfully deleted')));
    setState(() {
      _searchResult = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter User ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an ID';
                    }
                    _searchId = value;
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _searchById,
                  child: Text('Search'),
                  style: ElevatedButton.styleFrom(primary: Color(0xFF2C7865)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          _isLoading
              ? CircularProgressIndicator()
              : _searchResult != null
              ? Card(
            color: Color(0xFFF1F8E9),
            child: ListTile(
              title: Text(_searchResult!['name'], style: TextStyle(color: Color(0xFF2C7865))),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Age: ${_searchResult!['age']}", style: TextStyle(color: Color(0xFF2C7865))),
                  Text("Email: ${_searchResult!['email']}", style: TextStyle(color: Color(0xFF2C7865))),
                  Text("Course: ${_searchResult!['course']}", style: TextStyle(color: Color(0xFF2C7865))),
                  Text("ID: ${_searchResult!['id']}", style: TextStyle(color: Color(0xFF2C7865))),
                ],
              ),
            ),
          )
              : Text('No results'),
          _searchResult != null
              ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () => _deleteUserById(_searchResult!.id),
              child: Text('Delete User'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          )
              : Container(),
        ],
      ),
    );
  }
}
