import 'dart:math';

import 'package:financial_control/src/features/home/historic/model/category.entity.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/colors/colors.dart';
import '../../../../common/database/database_controller.dart';
import '../../../../common/extensions/string_extensions.dart';
import '../../../splash_screen/presentation/splash_screen.page.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../historic/model/category.dart';
import '../../historic/model/event.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  Categories categoriesEntity = Categories();
  DatabaseController databaseController = DatabaseController();
  List eventList = [];
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child(userId).child('events');
  List debitList = [];
  List creditsList = [];
  List categoryCreditList = [];
  List categoryDebitList = [];
  String _categorySelected = 'Débito';
  String categorias = "";
  final formatter =
      NumberFormat.simpleCurrency(locale: "pt_Br", decimalDigits: 2);
  String _typeSelected = 'Débito';
  bool eventIsDebit = true;
  List sum = [];

  double AllSum = 0;

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

  isDebit(EventEntity element) {
    eventIsDebit = element.eventData!.type == "Débito";
    // return eventIsDebit;
  }

  void testC() {
    for (int i = 0; i < eventList.length; i++) {
      var test = eventList[i].eventData!.category!;
      if (eventList[i].eventData!.type == "Débito") {
        categoryDebitList.add(test);
      } else {
        categoryCreditList.add(test);
      }
    }
  }

  void test() {
    for (int i = 0; i < eventList.length; i++) {
      var test = eventList[i].eventData!.value!.replaceAll('.', '');
      if (eventList[i].eventData!.type == "Débito") {
        debitList.add(double.parse(test.replaceAll(",", ".")));
      } else {
        creditsList.add(double.parse(test.replaceAll(",", ".")));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    retrieveStudentData();
    super.initState();
  }

  int touchedIndex = -1;

  // Widget _buildEventCategory() {
  //   return InkWell(
  //     child: Container(
  //       height: 40,
  //       width: 110,
  //       decoration: BoxDecoration(
  //         color:
  //             CustomColors.secundaryRed
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: Center(
  //         child: Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 18,
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //     ),
  //     onTap: () {
  //       setState(() {
  //         _categorySelected = title;
  //         categoryDebitList.clear();
  //         categoryCreditList.clear();
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    debitList.clear();
    creditsList.clear();
    categoryDebitList.clear();
    categoryCreditList.clear();
    sum.clear();
    test();
    testC();

    for (String sector2 in categoryCreditList) {
      categorias = sector2;
    }
    eventList.sort((a, b) {
      return a.eventData!.category
          .toString()
          .toLowerCase()
          .compareTo(b.eventData!.category.toString().toLowerCase());
    });

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 1,
        child: SingleChildScrollView(
          child: !eventList.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildEventCategory("Débito"),
                        _buildEventCategory("Receita"),
                      ],
                    ),
                    Container(
                        height: 130,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            sections: _chartSections(),
                            centerSpaceRadius:
                                MediaQuery.of(context).size.height / 30,
                          ),
                          swapAnimationDuration: Duration(milliseconds: 690),
                          // Optional
                          swapAnimationCurve: Curves.linear, //
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: 450,
                      child: ListView(
                        children: eventList.where((element) {
                          isDebit(element);
                          return element.eventData!.type == _categorySelected;
                        }).map<Widget>((category) {
                          List test2 = [];
                          test2.add(double.parse(category.eventData!.value!
                              .replaceAll('.', '')
                              .replaceAll(',', '.')));

                          double t = test2.fold(0, (p, c) => p + c);
                          sum.add(t);
                          AllSum = sum.fold(0, (p, c) => p + c);
                          double debitSum = debitList.fold(0, (p, c) => p + c);
                          double creditSum =
                              creditsList.fold(0, (p, c) => p + c);
                          bool isDebit = _categorySelected == "Débito";
                          return SectorRow(category, debitList, debitSum,
                              creditSum, isDebit);
                        }).toList(),
                      ),
                    ),
                  ],
                )
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
                            "Quando você registrar movimentações, seu gráfico irá aparecer aqui\n 💸",
                        fontWeight: null,
                        fontSize: 18,
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildEventCategory(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 110,
        decoration: BoxDecoration(
          color: _categorySelected == title
              ? CustomColors.secundaryRed
              : CustomColors.primayRed,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _categorySelected = title;
          eventIsDebit = _categorySelected == "Gastos";
        });
      },
    );
  }

  List<PieChartSectionData> _chartSections() {
    final List<PieChartSectionData> debitListData = [];
    final List<PieChartSectionData> creditListData = [];
    var catList = [];
    var catList2 = [];
    var categoryDebit;
    var categoryCredit;

    for (String sector in categoryDebitList) {
      var test = sector;
      categoryDebit = test;
      catList.add(categoryDebit);
    }

    for (String sector2 in categoryCreditList) {
      var test2 = sector2;
      categoryCredit = test2;
      catList2.add(categoryCredit);
    }

    // for (String sector in categoryCreditList) {
    //   var test = sector;
    //   categoryCredit = test;
    //   color = categoryEntity.getColorByCategory(categoryCredit);
    //   catList2.add(categoryCredit);
    // }
    //
    // for (double sector in debitList) {
    //   for (String cat1 in catList) {
    //     var test = sector.toString().replaceAll('.', '');
    //     double radius = MediaQuery.of(context).size.height / 9;
    //     final data = PieChartSectionData(
    //       color: categoriesEntity.getColorByCategory(cat1, "Débito"),
    //       value: double.parse(((test.replaceAll(",", ".")))),
    //       radius: radius,
    //       title: '',
    //     );
    //     debitListData.add(data);
    //   }
    // }

    for (EventEntity sector2 in eventList.where((element) {
      return element.eventData!.type == _categorySelected;
    })) {
      var test2 = sector2.eventData!.value!.toString().replaceAll('.', '');
      double radius = MediaQuery.of(context).size.height / 20;
      final data = PieChartSectionData(
        color: getColorByCategory(
            sector2.eventData!.category!, sector2.eventData!.type!),
        value: double.parse(((test2.replaceAll(",", ".")))),
        radius: radius,
        title: '',
      );
      creditListData.add(data);
    }

    // for (double sector in creditsList) {
    //   for (String cat2 in catList2) {
    //     var test = sector.toString().replaceAll('.', '');
    //     const double radius = 40.0;
    //     final data = PieChartSectionData(
    //       color: categoryEntity.getColorByCategory(cat2),
    //       value: double.parse(((test.replaceAll(",", ".")))),
    //       radius: radius,
    //       title: '',
    //     );
    //     creditListData.add(data);
    //   }
    // }
    // if (_categorySelected == "Débito") {
    //   return debitListData;
    // }
    return creditListData;
  }
}

class SectorRow extends StatelessWidget {
  double debitSum;
  double creditSum;
  List debitList;
  bool isDebit;

  SectorRow(
      this.sector, this.debitList, this.debitSum, this.creditSum, this.isDebit,
      {Key? key})
      : super(key: key);
  final EventEntity sector;

  @override
  Widget build(BuildContext context) {
    List test2 = [];
    //print(sector.eventData!.value!);
    test2.add(double.parse(
        sector.eventData!.value!.replaceAll('.', '').replaceAll(',', '.')));

    var test = sector.eventData!.value!.replaceAll('.', '');
    // print(sum);
    print(debitList);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 0.6),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade50.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: CustomColors.fourthRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 16,
                  child: CircleAvatar(
                    backgroundColor: getColorByCategory(
                      sector.eventData!.category!,
                      sector.eventData!.type!,
                    ),
                  ),
                ),
                const Spacer(),
                Text(sector.eventData!.category!,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const Spacer(),
                Text(
                  isDebit
                      ? (((double.parse(test.replaceAll(',', '.')) /
                                      debitSum)) *
                                  100)
                              .toStringAsFixed(2) +
                          "%"
                      : (((double.parse(test.replaceAll(',', '.')) /
                                      creditSum)) *
                                  100)
                              .toStringAsFixed(2) +
                          "%",
                  //sector.eventData!.value!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descrição: ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  sector.eventData!.description!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Sector {
  final Color color;
  final double value;
  final String title;

  Sector({required this.color, required this.value, required this.title});
}
