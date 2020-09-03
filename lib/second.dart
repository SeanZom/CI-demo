import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Second Page'),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second/sub');
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
