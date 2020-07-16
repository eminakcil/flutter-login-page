import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Welcome !',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
          ),
        ),
      ),
    );
    ;
  }
}
