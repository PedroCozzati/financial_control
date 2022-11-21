import 'dart:math';

import 'package:financial_control/src/features/home/historic/domain/category.entity.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/colors/colors.dart';
import '../../../../common/database/database_controller.dart';
import '../../../splash_screen/presentation/splash_screen.page.dart';
import '../../historic/model/event.dart';

class PieChartWidget extends StatefulWidget {

  const PieChartWidget( {Key? key}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  CategoryEntity categoryEntity = CategoryEntity();
  DatabaseController databaseController = DatabaseController();
  List eventList = [];
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child(userId).child('events');
  List debitList = [];
  List creditsList = [];
  List categoryCreditList = [];
  List categoryDebitList = [];
  String _categorySelected = '';
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
          categoryDebitList.clear();
          categoryCreditList.clear();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debitList.clear();
    creditsList.clear();
    categoryDebitList.clear();
    categoryCreditList.clear();

    test();
    testC();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildEventCategory('Receita'),
            _buildEventCategory("Débito"),
          ],
        ),
        Container(
            height: 200,
            child: PieChart(
              PieChartData(
                sections: _chartSections(),
                centerSpaceRadius: 48.0,
              ),
              swapAnimationDuration: Duration(seconds: 2),
            )),
        Container(
          height: 300,
          width: 400,
          child: ListView(
            children: eventList
                .map<Widget>((category) => SectorRow(category))
                .toList(),
          ),
        ),
      ],
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

    for (double sector in debitList) {
      for (String cat1 in catList) {
        var test = sector.toString().replaceAll('.', '');
        const double radius = 40.0;
        final data = PieChartSectionData(
          color: categoryEntity.getColorByCategory(cat1),
          value: double.parse(((test.replaceAll(",", ".")))),
          radius: radius,
          title: '',
        );
        debitListData.add(data);
      }
    }

    for (double sector2 in creditsList) {
      for (String cat2 in catList2) {
        var test2 = sector2.toString().replaceAll('.', '');
        const double radius = 40.0;
        final data = PieChartSectionData(
          color: categoryEntity.getColorByCategory(cat2),
          value: double.parse(((test2.replaceAll(",", ".")))),
          radius: radius,
          title: '',
        );

       creditListData.add(data);
      }
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
    if (_categorySelected == "Débito") {
      return debitListData;
    }
    return creditListData;
  }
}

class SectorRow extends StatelessWidget {
  CategoryEntity categoryEntity = CategoryEntity();

  SectorRow(this.sector, {Key? key}) : super(key: key);
  final EventEntity sector;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          child: CircleAvatar(
            backgroundColor:
                categoryEntity.getColorByCategory(sector.eventData!.category!),
          ),
        ),
        const Spacer(),
        Text(sector.eventData!.category!),
        const Spacer(),
        Text(sector.eventData!.value!),
      ],
    );
  }
}

class Sector {
  final Color color;
  final double value;
  final String title;

  Sector({required this.color, required this.value, required this.title});
}


