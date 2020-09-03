import 'package:ci_demo/second.dart';
import 'package:ci_demo/third.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Route _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<MyHomePage>(
        builder: (_) => const MyHomePage(
          title: 'Main',
        ),
        settings: RouteSettings(name: settings.name),
      );
    case '/second':
      return MaterialPageRoute<SecondPage>(
        builder: (_) => const SecondPage(),
        settings: RouteSettings(name: settings.name),
      );
    case '/second/sub':
      return MaterialPageRoute<ThirdPage>(
        builder: (_) => const ThirdPage(),
        settings: RouteSettings(name: settings.name),
      );
    default:
      return MaterialPageRoute<Widget>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
        settings: RouteSettings(name: settings.name),
      );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: _generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48.0,
          horizontal: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 32.0),
            TextField(
              autofillHints: [AutofillHints.name],
              decoration: InputDecoration(hintText: 'Name'),
            ),
            TextField(
              autofillHints: [AutofillHints.postalAddress],
              decoration: InputDecoration(hintText: 'postalAddress'),
            ),
            const SizedBox(height: 24.0),
            AutofillGroup(
              key: const ValueKey('newuser'),
              child: Column(
                children: [
                  TextField(
                    autofillHints: [
                      AutofillHints.username,
                      AutofillHints.email,
                      AutofillHints.telephoneNumber,
                    ],
                    decoration: InputDecoration(hintText: 'username'),
                  ),
                  TextField(
                    autofillHints: [AutofillHints.password],
                    decoration: InputDecoration(hintText: 'password'),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('To next'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
