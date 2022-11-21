import 'package:dartz/dartz_unsafe.dart';
import 'package:financial_control/src/common/database/database_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/colors/colors.dart';
import '../../../splash_screen/presentation/splash_screen.page.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../historic/model/event.dart';

class HomeCarouselOne extends StatefulWidget {
  const HomeCarouselOne({Key? key}) : super(key: key);

  @override
  State<HomeCarouselOne> createState() => _HomeCarouselOneState();
}

class _HomeCarouselOneState extends State<HomeCarouselOne> {
  Map event = {};
  late Query _ref;
  double debits = 0;
  double credits = 0;
  double debitsPercentage = 0;
  DatabaseController databaseController = DatabaseController();
  List eventList = [];
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child(userId).child('events');
  List debitList = [];
  List creditsList = [];
  final formatter =
      NumberFormat.simpleCurrency(locale: "pt_Br", decimalDigits: 2);

  void retrieveStudentData() {
    reference.onChildAdded.listen((data) {
      EventData eventData = EventData.fromJson(data.snapshot.value as Map);
      EventEntity event =
          EventEntity(key: data.snapshot.key, eventData: eventData);
      eventList.add(event);
      print(event.eventData);
      setState(() {});
    });
  }

  void test() {
    for (int i = 0; i < eventList.length; i++) {
      var test = eventList[i].eventData!.value!.replaceAll('.', '');
      if (eventList[i].eventData!.type == "Débito") {

        debitList.add(
            double.parse(test.replaceAll(",", ".")));
      } else {
        creditsList.add(
            double.parse(test.replaceAll(",", ".")));
      }
    }
  }

  @override
  void initState() {
    retrieveStudentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debitsPercentage = ((1 - (credits / (debits + credits))) * 100).abs();
    debitList.clear();
    creditsList.clear();
    test();
    debits = debitList.fold(0, (p, c) => p + c);
    credits = creditsList.fold(0, (p, c) => p + c);
    print(debits);

    // EventEntity test = eventList.map((e) => e);
    //print(eventList);
    Future<bool> listIsEmpty = Future.delayed(Duration(milliseconds: 1000))
        .then((value) => value = eventList.isEmpty);
    //print(eventList);
    return FutureBuilder(
        future: listIsEmpty,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: Container(
                    height: 120,
                    child: Lottie.asset(
                        'lib/assets/loading_animation/loading_on_app.json')));
          } else if (snapshot.data == false) {
            return homeList();
          } else {
            return homeList();
          }
        });
  }

  Widget percentBar() {
    return Container(
      height: 180,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  credits + debits != 0
                      ? ((1 - (credits / (debits + credits))) * 100)
                              .abs()
                              .toStringAsFixed(2) +
                          " %"
                      : "0",
                  style: TextStyle(fontSize: 22),
                ),
                //Text(),
                Text(
                  credits + debits != 0
                      ? (100 - ((1 - (credits / (debits + credits))) * 100))
                              .abs()
                              .toStringAsFixed(2) +
                          " %"
                      : "0",
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
            Container(
              height: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red.shade300),
                  backgroundColor:
                      credits + debits != 0 ? Colors.green.shade300 : Colors.grey,
                  value: credits + debits != 0
                      ? (1 - (credits / (debits + credits))).abs()
                      : 0,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
            ),
            SizedBox(height: 30,),
            credits + debits != 0
                ? subtitles()
                : Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x2b64c7b0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomText(
                          text:
                              "Quando você registrar movimentações, as informações irão aparecer acima\n 💸",
                          fontWeight: null,
                          fontSize: 18,
                          color: Colors.black, textAlign: TextAlign.center,
                        ),
                    ),
                  ),
                )
          ]),
    );
  }

  Widget subtitles() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.red.shade300),
            ),
            Text(
              '   Gastos',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        //Text(),
        Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.green.shade300),
            ),
            Text('   Receita', style: TextStyle(fontSize: 20))
          ],
        ),
      ],
    );
  }

  Widget homeTexts() {
    return Container(
      height: 200,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          decoration: BoxDecoration(
              color: CustomColors.primaryWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black54)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  fontSize: 18,
                  text: "Total:",
                  color: Colors.black,
                  fontWeight: null, textAlign: null,
                ),
                CustomText(
                  fontSize: 22,
                  text: "   ${formatter.format((debits + credits).abs())}",
                  color: Colors.black,
                  fontWeight: FontWeight.bold, textAlign: null,
                ),
              ],
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    fontSize: 18,
                    text: "Total de gastos:",
                    color: Colors.black,
                    fontWeight: null, textAlign: null,
                  ),
                  CustomText(
                    fontSize: 18,
                    text: "   ${formatter.format(debits)}",
                    color: Colors.black,
                    fontWeight: FontWeight.bold, textAlign: null,
                  ),
                ],
              ),
            )),
        Container(
            decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    fontSize: 18,
                    text: "Total de receita:",
                    color: Colors.black,
                    fontWeight: null, textAlign: null,
                  ),
                  CustomText(
                    fontSize: 18,
                    text: "   ${formatter.format(credits)}",
                    color: Colors.black,
                    fontWeight: FontWeight.bold, textAlign: null,
                  ),
                ],
              ),
            )),
        Container(
            decoration: BoxDecoration(
                color: credits -debits > 0.0?Colors.green.shade50:Colors.red.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      fontSize: 18,
                      text: " Lucro:",
                      color: Colors.black,
                      fontWeight: null, textAlign: null,
                    ),
                    CustomText(
                      fontSize: 18,
                      text: "   ${formatter.format(credits - debits)}",
                      color: Colors.black,
                      fontWeight: FontWeight.bold, textAlign: null,
                    ),
                  ],
                )))
      ]),
    );
  }

  Widget homeList() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          height: 600,
          color: CustomColors.primaryWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeTexts(),
              percentBar()

              // Text(event['value']),
              // Text(event['description']),
              // Text(event['date']),
              // Text(event['category']),
              // Text(event['isCredit']),
            ],
          ),
        ),
      ),
    );
  }
}
