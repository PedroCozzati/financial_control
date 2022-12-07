import 'dart:math';

import 'package:financial_control/src/common/database/database_controller.dart';
import 'package:financial_control/src/model/event.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/colors/colors.dart';
import '../../../splash_screen/presentation/splash_screen.page.dart';
import '../../../widgets/custom_text/custom_text.dart';

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
  double allDebits = 0;
  double allCredits = 0;
  DatabaseController databaseController = DatabaseController();
  List eventList = [];
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child(userId).child('events');
  List debitList = [];
  List allPeriodDebitList = [];
  List allPeriodCreditList = [];
  List creditsList = [];
  List<int> monthPeriod = [];
  List<int> yearPeriod = [];
  bool seeAllPeriod = false;
  final formatter =
      NumberFormat.simpleCurrency(locale: "pt_Br", decimalDigits: 2);

  void retrieveStudentData() {
    reference.onChildAdded.listen((data) {
      print(data.snapshot.value as Map);
      EventData eventData = EventData.fromJson(data.snapshot.value as Map);
      EventEntity event =
          EventEntity(key: data.snapshot.key, eventData: eventData);
      eventList.add(event);
      print(event.eventData);
      setState(() {});
    });
  }

  void test() {
    initializeDateFormatting('pt_BR', null);

    DateFormat format = DateFormat("dd-MM-yyyy", "pt_br").add_yMd();
    for (int i = 0; i < eventList.length; i++) {
      DateTime timer =
          DateFormat('dd-MM-yyyy').parse(eventList[i].eventData!.date);
      monthPeriod.add(timer.month);
      yearPeriod.add(timer.year);

      var test = eventList[i].eventData!.value!.replaceAll('.', '');
      if (eventList[i].eventData!.type == "Despesas") {
        allPeriodDebitList.add(double.parse(test.replaceAll(",", ".")));
        if (timer.month == selectedMonthValue &&
            timer.year == selectedYearValue)
          debitList.add(double.parse(test.replaceAll(",", ".")));
      } else {
        if (eventList[i].eventData!.type != "Despesas") {
          allPeriodCreditList.add(double.parse(test.replaceAll(",", ".")));
          if (timer.month == selectedMonthValue &&
              timer.year == selectedYearValue) {
            creditsList.add(double.parse(test.replaceAll(",", ".")));
          }
        }
      }
    }
  }

  int selectedMonthValue = DateTime.now().month;
  int selectedYearValue = DateTime.now().year;

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
    allPeriodDebitList.clear();
    allPeriodCreditList.clear();
    test();
    debits = debitList.fold(0, (p, c) => p + c);
    credits = creditsList.fold(0, (p, c) => p + c);
    allDebits = allPeriodDebitList.fold(0, (p, c) => p + c);
    allCredits = allPeriodCreditList.fold(0, (p, c) => p + c);
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
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        height: 100,
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
                    style: TextStyle(fontSize: 18),
                  ),
                  //Text(),
                  Text(
                    credits + debits != 0
                        ? (100 - ((1 - (credits / (debits + credits))) * 100))
                                .abs()
                                .toStringAsFixed(2) +
                            " %"
                        : "0",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Container(
                height: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    minHeight: 10,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.red.shade300),
                    backgroundColor: credits + debits != 0
                        ? Colors.green.shade300
                        : Colors.grey,
                    value: credits + debits != 0
                        ? (1 - (credits / (debits + credits))).abs()
                        : 0,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              subtitles(),
            ]),
      ),
    );
  }

  Widget subtitles() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red.shade300),
                ),
                Text(
                  '   Despesas',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green.shade300),
                ),
                Text('   Receita', style: TextStyle(fontSize: 18))
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        //Text(),

      ],
    );
  }

  List<dynamic> list = [1, 2];
  int dropdownValue = DateTime.now().month;

  getMonthsByValue(int value) {
    switch (value) {
      case 1:
        return "Jan";
      case 2:
        return "Fev";
      case 3:
        return "Mar";
      case 4:
        return "Abr";
      case 5:
        return "Mai";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Ago";
      case 9:
        return "Set";
      case 10:
        return "Out";
      case 11:
        return "Nov";
      case 12:
        return "Dez";
    }
  }

  Widget homeTexts() {
    print(monthPeriod.toSet().toList());
    return Container(
      height: 455,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: allCredits - allDebits > 0.0
                      ? Colors.green.shade50
                      : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black54)),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        fontSize: 18,
                        text: "Saldo atual:",
                        color: Colors.black,
                        fontWeight: null,
                        textAlign: null,
                      ),
                      CustomText(
                        fontSize: 18,
                        text: "   ${formatter.format(allCredits - allDebits)}",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        textAlign: null,
                      ),
                    ],
                  ))),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black54)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        child: Text(
                          'Período: ',
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0x415B9B5B),
                        ),
                        child: DropdownButton<int>(
                          // Step 3.
                          value: selectedMonthValue,
                          // Step 4.
                          items: monthPeriod
                              .toSet()
                              .toList()
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                getMonthsByValue(value),
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (int? newValue) {
                            setState(() {
                              selectedMonthValue = newValue!;
                            });
                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        child: Text(
                          '/',
                          style:
                              TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0x415B9B5B),
                        ),
                        child: DropdownButton<int>(
                          // Step 3.
                          value: selectedYearValue,
                          // Step 4.
                          items: yearPeriod
                              .toSet()
                              .toList()
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (int? newValue) {
                            setState(() {
                              selectedYearValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
                              text: "Total de despesas:",
                              color: Colors.black,
                              fontWeight: null,
                              textAlign: null,
                            ),
                            CustomText(
                              fontSize: 18,
                              text: "   ${formatter.format(debits)}",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              textAlign: null,
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
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
                              fontWeight: null,
                              textAlign: null,
                            ),
                            CustomText(
                              fontSize: 18,
                              text: "   ${formatter.format(credits)}",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              textAlign: null,
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: credits - debits > 0.0
                            ? Colors.green.shade50
                            : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black54)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            fontSize: 18,
                            text: "Saldo mensal:",
                            color: Colors.black,
                            fontWeight: null,
                            textAlign: null,
                          ),
                          CustomText(
                            fontSize: 18,
                            text: "   ${formatter.format(credits - debits)}",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            textAlign: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  credits + debits != 0
                      ? percentBar()
                      : Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0x2b64c7b0),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomText(
                          text: monthPeriod.isEmpty && yearPeriod.isEmpty
                              ? "Você ainda não registrou nenhuma movimentação\n 💸"
                              : "Você não registrou nenhuma movimentação nesse período\n 💸",
                          fontWeight: null,
                          fontSize: 18,
                          color: Colors.black,
                          textAlign: TextAlign.center,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget homeList() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          height: 530,
          color: CustomColors.primaryWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeTexts(),
              // credits + debits != 0
              //     ? percentBar()
              //     : Center(
              //         child: Container(
              //           decoration: BoxDecoration(
              //             color: Color(0x2b64c7b0),
              //             borderRadius: BorderRadius.all(Radius.circular(20)),
              //           ),
              //           child: Padding(
              //             padding: const EdgeInsets.all(20.0),
              //             child: CustomText(
              //               text: monthPeriod.isEmpty && yearPeriod.isEmpty
              //                   ? "Você ainda não registrou nenhuma movimentação\n 💸"
              //                   : "Você não registrou nenhuma movimentação nesse período\n 💸",
              //               fontWeight: null,
              //               fontSize: 18,
              //               color: Colors.black,
              //               textAlign: TextAlign.center,
              //             ),
              //           ),
              //         ),
              //       ),

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
