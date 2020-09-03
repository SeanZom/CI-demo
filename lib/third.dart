import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Third Page'),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text('to next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
