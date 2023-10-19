import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Consumer App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("https://techy-api.vercel.app/api/json"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        message = data["message"];
      });
    } else {
      setState(() {
        message = "Failed to fetch data";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Consumer App'),
      ),
      body: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
