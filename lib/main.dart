
import 'package:Covid19Nigeria/HomePage.dart';
import 'package:Covid19Nigeria/Providers/AppBrain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  SyncfusionLicense.registerLicense("NT8mJyc2IWhia31ifWN9Z2FoZnxhfGFjYWNzZmljZGlna3MDHmgxJjgmPT46Mjc2JDI/NmATND4yOj99MDw+");
  return runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider(
      
      create: (_) => AppBrain(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid-19 Nigeria',
        theme: ThemeData(
        primaryColor:Color(0xff00cc99) ,
         // primarySwatch:  Colors.grey,
          buttonColor:  Color(0xff00cc99),
         // textTheme: TextTheme()
        ),
        home: SafeArea(child: HomePage()),
      ),
    );
  }
}

