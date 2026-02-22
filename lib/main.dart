import 'package:flutter/material.dart';
import 'package:flutter_practice_project/utils/unit_converter_functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This widget is the root of your application.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double? _conversionResult; 

  void _incrementCounter() {
    // This call to setState tells the Flutter framework that something has changed in this State
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (String input) {
                  double? parsedAmount = double.tryParse(input);
                  if (parsedAmount != null) {
                   double amount = parsedAmount;
                  var result = convertCelsiusToFahrenheit(parsedAmount);
                  setState(() {
                    _conversionResult = result;
                  });
                  } else {
                    // Added this so if the user deletes their input, the result clears
                    setState(() {
                      _conversionResult = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Celsius',
                ),
              ),
            ),
            const SizedBox(height: 20), 

            // ADD THIS: The widget that displays your result
            Text(
              _conversionResult != null 
                  ? 'Result: $_conversionResult'
                  :'Waiting for input...',
              style: const TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                color: Colors.deepPurple,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
