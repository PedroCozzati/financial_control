import 'package:financial_control/src/features/home/historic/presentation/historic.page.dart';
import 'package:financial_control/src/features/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../common/colors/colors.dart';
import 'add_event/add_event.dart';
import 'home_carousel/presentation/home_carousel_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late List eventList;

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    HistoricPage(),
    HomeCarouselMain(),
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
          ],
          backgroundColor: CustomColors.primaryWhite,
          unselectedItemColor: CustomColors.thirdRed,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: CustomColors.primayRed,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5),
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: CustomColors.primaryWhite,
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FloatingActionButton(
                tooltip: "Incluir novos gastos",
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    'create_event',
                  );
                },
                backgroundColor: Color(0xff5e7848),
                child: Icon(
                  Icons.add,
                  size: 50,
                ),
              ),
            ),
          ),
          // Container(
          //   height: 80,
          //   color: CustomColors.primaryBlue,
          //   child: Center(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Icon(
          //           Icons.monetization_on_outlined,
          //           color: CustomColors.primaryWhite,
          //         ),
          //         FloatingActionButton(
          //           tooltip: "Incluir novos gastos",
          //           onPressed: (){},
          //           backgroundColor: CustomColors.thirdBlue,
          //           child: Icon(
          //             Icons.add,
          //             size: 50,
          //           ),
          //         ),
          //         Icon(
          //           Icons.money,
          //           color: CustomColors.primaryWhite,
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
