import 'package:flutter/material.dart';
import 'package:lab31/provider.dart';
import 'package:provider/provider.dart';
import 'first.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> InputProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(      
          primarySwatch: Colors.pink,
        ),
        home:  MyHomePage(),
      ),
    );
  }
}