import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:Covid19Nigeria/Pages/CheckerPage.dart';
import 'package:Covid19Nigeria/Pages/InformationPage.dart';
import 'package:Covid19Nigeria/Pages/NewsPage.dart';
import 'package:Covid19Nigeria/Pages/StatesPage.dart';

import 'package:Covid19Nigeria/Providers/AppBrain.dart';
import 'package:Covid19Nigeria/utils/theme.dart';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
void initState() { 
  super.initState();
    Provider.of<AppBrain>(context,listen: false).fetchStats();
     Provider.of<AppBrain>(context,listen: false).fetchNews();
}
    PageController pageController = new PageController(
      initialPage: 0,
    );
  int index = 0; 
  @override
  Widget build(BuildContext context) {
  
 
    return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffefeff2),
          body: PageView(
            onPageChanged: (i) {
              setState(() {
                index=i;
              });
            },
            controller: pageController,
            children: <Widget>[
              StatesPage(),
              NewsPage(),
              InformationPage(),
//               CheckerPage()
            ],
          ),
          bottomNavigationBar: BottomNavyBar(
              selectedIndex: index,
              items: [
                BottomNavyBarItem(
                  icon: Icon(LineIcons.home),
                  title: Text('Home'),
                  activeColor: AppTheme().kcolors[0],
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(LineIcons.newspaper_o),
                  title: Text('News'),
                  activeColor: AppTheme().kcolors[1],
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(LineIcons.list_ul),
                  title: Text(
                    'Guides',
                  ),
                  activeColor:AppTheme().kcolors[3],
                  textAlign: TextAlign.center,
                ),
//                BottomNavyBarItem(
//                  icon: Icon(LineIcons.check),
//                  title: Text('Checker'),
//                  activeColor: AppTheme().kcolors[2],
//                  textAlign: TextAlign.center,
//                ),
              ],
              onItemSelected: (indx) {
                setState(() {
                  index = indx;
                });
                pageController.jumpToPage(index);
              })),
    );
  }
}
