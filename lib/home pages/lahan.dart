import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'formulir_lahan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LahanPage extends StatefulWidget {
  @override
  _LahanPageState createState() => _LahanPageState();
}

class _LahanPageState extends State<LahanPage> {
  List<dynamic> _landData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLandData();
  }

  Future<void> _fetchLandData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle token absence (e.g., redirect to login)
      return;
    }

    final response = await http.get(
      Uri.parse('http://bfarm.ahmadyaz.my.id/api/lands'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      // Assuming the responseData is a map and contains a list of lands
      // Update this part according to the actual API response structure
      if (responseData is Map<String, dynamic> &&
          responseData['data'] is List) {
        setState(() {
          _landData = responseData['data'];
          _isLoading = false;
        });
      } else {
        // Handle unexpected response structure
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unexpected response structure')),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      // Handle API error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch land data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lahan Anda'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _landData.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Anda belum memiliki lahan.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FormulirPenambahanLahan()),
                          );
                        },
                        child: Icon(Icons.add),
                        backgroundColor: Color(0xFF6EBF45),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _landData.length,
                  itemBuilder: (context, index) {
                    var land = _landData[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              land['land_description'] ?? 'No Description',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Location: ${land['location']}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Area: ${land['land_area']} m2',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
