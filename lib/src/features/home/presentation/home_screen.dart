import 'package:financial_control/src/features/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../common/colors/colors.dart';
import '../home_carousel/home_carousel_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    HomeCarouselMain(),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Histórico',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
              backgroundColor: Colors.blue,
            ),
          ],
          backgroundColor: CustomColors.secondaryBlue,
          unselectedItemColor: CustomColors.primaryWhite,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: CustomColors.primaryGreen,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5),
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: CustomColors.secondaryBlue,
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
          Container(
            height: 80,
            color: CustomColors.primaryBlue,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    color: CustomColors.primaryWhite,
                  ),
                  FloatingActionButton(
                    tooltip: "Incluir novos gastos",
                    onPressed: (){},
                    backgroundColor: CustomColors.thirdBlue,
                    child: Icon(
                      Icons.add,
                      size: 50,
                    ),
                  ),
                  Icon(
                    Icons.money,
                    color: CustomColors.primaryWhite,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
