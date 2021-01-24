import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/Providers/CounterProvider.dart';
import 'package:provider_app/Providers/ThemeProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<CounterProvider>(create: (_) => CounterProvider())
      ],
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: Provider.of<ThemeProvider>(context).theme
          ? ThemeMode.dark
          : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider App'),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    '${Provider.of<CounterProvider>(context).count}',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Light Mode',
                    style: TextStyle(color: Colors.black),
                  ),
                  Switch(
                    value: Provider.of<ThemeProvider>(context).theme,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeTheme();
                    },
                  ),
                  Text(
                    'Dark Mode',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Provider.of<CounterProvider>(context, listen: false).increase();
          },
        ),
      ),
    );
  }
}
