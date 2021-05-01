
import 'package:CWCFlutter/homePage.dart';
import 'package:CWCFlutter/notifier/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FoodNotifier(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coding with Curry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
      ),
      home:WelcomeChoix(),
        
      
    );
  }
}
