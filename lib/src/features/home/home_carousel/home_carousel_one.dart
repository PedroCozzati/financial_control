import 'package:flutter/material.dart';

import '../../../common/colors/colors.dart';

class HomeCarouselOne extends StatefulWidget {
  const HomeCarouselOne({Key? key}) : super(key: key);

  @override
  State<HomeCarouselOne> createState() => _HomeCarouselOneState();
}

class _HomeCarouselOneState extends State<HomeCarouselOne> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        height: 400,
        color: CustomColors.secondaryBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Saldo Atual"),
                Row(
                  children: [
                    Text("Mês"),
                    Container(
                      height: 20,
                      width: 50,
                      color: CustomColors.primaryWhite,
                    ),
                  ],
                ),
              ],
            ),
            Text("R\$ 30,00"),
            Text("Gastos"),
            Text("R\$ 300,00"),
            Container(
              height: 20,
              color: CustomColors.primaryWhite,
            ),
            Container(
              height: 20,
              color: CustomColors.primaryWhite,
            ),
          ],
        ),
      ),
    );
  }
}
