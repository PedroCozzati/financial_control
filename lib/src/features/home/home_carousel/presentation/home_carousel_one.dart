

import 'package:financial_control/src/common/database/database_controller.dart';
import 'package:flutter/material.dart';


import '../../../../common/colors/colors.dart';
import '../../../widgets/custom_text/custom_text.dart';

class HomeCarouselOne extends StatefulWidget {
  const HomeCarouselOne({Key? key}) : super(key: key);

  @override
  State<HomeCarouselOne> createState() => _HomeCarouselOneState();
}

class _HomeCarouselOneState extends State<HomeCarouselOne> {

  Map event = {};

  DatabaseController databaseController = DatabaseController();

  @override
  void initState() {
    databaseController.readData().then((value) => event = value.value);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        height: 400,
        color: CustomColors.primaryWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  fontSize: 18,
                  text: 'Saldo Atual',
                  color: CustomColors.primaryWhite,
                  fontWeight: null,
                ),

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
            Text("Gastos"),
            // Text(event['value']),
            // Text(event['description']),
            // Text(event['date']),
            // Text(event['category']),
            // Text(event['isCredit']),

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
