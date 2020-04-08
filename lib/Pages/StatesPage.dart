
import 'package:Covid19Nigeria/Components/Charts.dart';
import 'package:Covid19Nigeria/Components/CountryCard.dart';
import 'package:Covid19Nigeria/Components/NewCasesCard.dart';
import 'package:Covid19Nigeria/Components/Title.dart';

import 'package:flutter/material.dart';




class StatesPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  
   
     
    return SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
        AppTitle(),
       
        Charts(),
        
        SizedBox(),
   
        CountryCard(),
        NewCasesCard(),
        
       ],
      ),
    );
  }
}