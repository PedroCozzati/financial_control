import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final List<Sector> sectors;

  const PieChartWidget(this.sectors, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            height: 200,
            child: PieChart(
              PieChartData(
                sections: _chartSections(sectors),
                centerSpaceRadius: 48.0,
              ),
              swapAnimationDuration: Duration(seconds: 2),
            )),
        Container(
          height: 300,
          width: 400,
          child: ListView(
            children: industrySectors
                .map<Widget>((sector) => SectorRow(sector))
                .toList(),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      const double radius = 40.0;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: '',
      );
      list.add(data);
    }
    return list;
  }
}

class SectorRow extends StatelessWidget {
  const SectorRow(this.sector, {Key? key}) : super(key: key);
  final Sector sector;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          child: CircleAvatar(
            backgroundColor: sector.color,
          ),
        ),
        const Spacer(),
        Text(sector.title),
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

List<double> get randomNumbers {
  final Random random = Random();
  final randomNumbers = <double>[];
  for (var i = 1; i <= 7; i++) {
    randomNumbers.add(random.nextDouble() * 100);
  }

  return randomNumbers;
}

List<Sector> get industrySectors {
  return [
    Sector(
        color: Colors.redAccent,
        value: randomNumbers[0],
        title: 'Information Technology'),
    Sector(
        color: Colors.blueGrey, value: randomNumbers[1], title: 'Automobile'),
    Sector(
        color: Colors.deepPurpleAccent, value: randomNumbers[2], title: 'Food'),
    Sector(color: Colors.yellow, value: randomNumbers[3], title: 'Finance'),
    Sector(color: Colors.black, value: randomNumbers[4], title: 'Energy'),
    Sector(color: Colors.orange, value: randomNumbers[5], title: 'Agriculture'),
    Sector(color: Colors.teal, value: randomNumbers[6], title: 'Pharma'),
    Sector(color: Colors.teal, value: randomNumbers[6], title: 'Pharma'),
    Sector(color: Colors.teal, value: randomNumbers[6], title: 'Pharma'),
  ];
}
