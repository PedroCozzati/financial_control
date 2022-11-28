// import 'dart:convert';
// import 'dart:math';
//
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../../common/colors/colors.dart';
//
// class LineChartWidget extends StatefulWidget {
//   final bool isPositiveChange;
//
//   LineChartWidget(this.isPositiveChange, {Key? key}) : super(key: key);
//
//   @override
//   State<LineChartWidget> createState() => _LineChartWidgetState();
// }
//
// class _LineChartWidgetState extends State<LineChartWidget> {
//   final List<InvestmentItem> _myData = [
//     InvestmentItem(
//       cotaCarteira: 23,
//       cotaCDI: 1,
//       cotaIpca: 1,
//       data: DateTime.utc(2010,2,2),
//     ),
//     InvestmentItem(
//       cotaCarteira: 30,
//       cotaCDI: 19,
//       cotaIpca: 15,
//       data: DateTime.utc(2011,3, 2),
//     ),
//     InvestmentItem(
//       cotaCarteira: 10,
//       cotaCDI: 5,
//       cotaIpca: 30,
//       data: DateTime.utc(2012,4, 2),
//     )
//   ];
//   bool showGrid = false;
//   List<int> _dashArray = [4, 2];
//   int year = 2021;
//   bool showIPCA = false;
//   bool showCDI = false;
//   bool isPerDay = false;
//   bool isPerMonth = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   // Future loadSalesData() async {
//   //   final String jsonString = await getJsonFromFirebase();
//   //   final dynamic jsonResponse = json.decode(jsonString);
//   //   for (Map<String, dynamic> i in jsonResponse) {
//   //     _myData.add(InvestmentItem.fromJson(i));
//   //   }
//   //   print(jsonResponse);
//   // }
//
//   // Future<String> getJsonFromFirebase() async {
//   //   String url =
//   //       "https://graph-poc-d3837-default-rtdb.firebaseio.com/rentabilidades.json";
//   //   http.Response response = await http.get(Uri.parse(url));
//   //   return response.body;
//   // }
//
//   String dropdownvalueIdx = "Nenhum";
//
//   // List of items in our dropdown menu
//   var itemsidx = [
//     "Alimentação",
//     "Combustivel",
//     "Lazer",
//   ];
//
//   String dropdownvalue = "2021";
//
//   // List of items in our dropdown menu
//   var items = [
//     "2021",
//     "2022",
//     "3 meses",
//     "6 meses",
//   ];
//
//   _returnMaxY(List<InvestmentItem> data) {
//     double productC =
//         data.map((point) => point.cotaCarteira.toDouble()).reduce(max);
//     double productIpca =
//         data.map((point) => point.cotaIpca.toDouble()).reduce(max);
//     double productCdi =
//         data.map((point) => point.cotaCDI.toDouble()).reduce(max);
//
//     List<double> values = [productC, productCdi, productIpca];
//     return values.reduce((value, element) => value > element ? value : element);
//   }
//
//   _returnMin(List<InvestmentItem> data) {
//     double productC =
//         data.map((point) => point.cotaCarteira.toDouble()).reduce(min);
//     double productIpca =
//         data.map((point) => point.cotaIpca.toDouble()).reduce(min);
//     double productCdi =
//         data.map((point) => point.cotaCDI.toDouble()).reduce(min);
//
//     List<double> values = [productC, productCdi, productIpca];
//     return values.reduce((value, element) => value < element ? value : element);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.primaryWhite,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 0,
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 30, bottom: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Periodo"),
//                         DropdownButton(
//                           // Initial Value
//                           value: dropdownvalue,
//                           isExpanded: false,
//
//                           // Down Arrow Icon
//                           icon: const Icon(Icons.keyboard_arrow_down),
//
//                           // Array list of items
//                           items: items.map((String items) {
//                             return DropdownMenuItem(
//                               value: items,
//                               child: Text(items),
//                             );
//                           }).toList(),
//
//                           onChanged: (String? newValue) async {
//                             setState(() {
//                               dropdownvalue = newValue!;
//                               year = int.parse(newValue);
//                             });
//                             _myData.clear();
//                           },
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 30),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text("Mostrar malha?"),
//                               Checkbox(
//                                   value: showGrid,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       showGrid = value!;
//                                     });
//                                   })
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text("Filtrar por dia"),
//                               Checkbox(
//                                   value: isPerDay,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       isPerDay = value!;
//                                     });
//                                   })
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 300,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 10, left: 20, right: 50),
//               child: FutureBuilder(builder: (context, snapshot) {
//                 if (1 == 1) {
//                   return LineChart(
//                     LineChartData(
//                         lineTouchData: LineTouchData(
//                             enabled: true,
//                             touchTooltipData: LineTouchTooltipData(
//                               fitInsideVertically: false,
//                               tooltipBgColor: Colors.black,
//                               tooltipRoundedRadius: 20.0,
//                               showOnTopOfTheChartBoxArea: false,
//                               fitInsideHorizontally: true,
//                               tooltipMargin: 0,
//                             ),
//                             getTouchedSpotIndicator: (LineChartBarData barData,
//                                 List<int> indicators) {
//                               return indicators.map(
//                                 (int index) {
//                                   final line = FlLine(
//                                       color: Colors.white,
//                                       strokeWidth: 1,
//                                       dashArray: _dashArray);
//                                   return TouchedSpotIndicatorData(
//                                     line,
//                                     FlDotData(
//                                         show: false,
//                                         getDotPainter:
//                                             (spot, percent, barData, index) {
//                                           return FlDotCirclePainter(
//                                             radius: 5.5,
//                                             color: Colors.white,
//                                             strokeWidth: 2,
//                                             strokeColor: Colors.white,
//                                           );
//                                         }),
//                                   );
//                                 },
//                               ).toList();
//                             },
//                             getTouchLineEnd: (_, __) => double.infinity),
//                         lineBarsData: [
//                           LineChartBarData(
//                             dotData: FlDotData(
//                                 show: true,
//                                 getDotPainter: (spot, percent, barData, index) {
//                                   return FlDotCirclePainter(
//                                     radius: 2.5,
//                                     strokeWidth: 2,
//                                     color: Colors.purpleAccent,
//                                     strokeColor: Colors.white,
//                                   );
//                                 }),
//                             spots: _myData
//                                 .map((dataItem) => FlSpot(
//                                       Jiffy(dataItem.data).dayOfYear.toDouble(),
//                                       dataItem.cotaCarteira.toDouble(),
//                                     ))
//                                 .toList(),
//                             //points.map((point) => FlSpot(point.x, point.y)).toList(),
//                             isCurved: true,
//                             colors: [
//                               widget.isPositiveChange
//                                   ? Colors.purpleAccent
//                                   : Colors.red,
//                             ],
//                           ),
//                           LineChartBarData(
//                             dotData: FlDotData(
//                                 show: true,
//                                 getDotPainter: (spot, percent, barData, index) {
//                                   return FlDotCirclePainter(
//                                     radius: 2.5,
//                                     strokeWidth: 2,
//                                     color: Colors.green,
//                                     strokeColor: Colors.white,
//                                   );
//                                 }),
//                             spots: _myData
//                                 .map((dataItem) => FlSpot(
//                                     Jiffy(dataItem.data).dayOfYear.toDouble(),
//                                     dataItem.cotaIpca.toDouble()))
//                                 .toList(),
//                             //points.map((point) => FlSpot(point.x, point.y)).toList(),
//                             isCurved: true,
//                             show: showIPCA,
//                             colors: [
//                               widget.isPositiveChange
//                                   ? Colors.green
//                                   : Colors.red,
//                             ],
//                           ),
//                           LineChartBarData(
//                             dotData: FlDotData(
//                                 show: false,
//                                 getDotPainter: (spot, percent, barData, index) {
//                                   return FlDotCirclePainter(
//                                     radius: 2.5,
//                                     strokeWidth: 2,
//                                     color: Colors.green,
//                                     strokeColor: Colors.white,
//                                   );
//                                 }),
//                             spots: _myData
//                                 .map((dataItem) => FlSpot(
//                                     Jiffy(dataItem.data).dayOfYear.toDouble(),
//                                     dataItem.cotaCDI.toDouble()))
//                                 .toList(),
//                             //points.map((point) => FlSpot(point.x, point.y)).toList(),
//                             isCurved: true,
//                             show: showCDI,
//                             colors: [
//                               widget.isPositiveChange
//                                   ? Colors.blueAccent
//                                   : Colors.red,
//                             ],
//                           ),
//                         ],
//                         minY: _returnMin(_myData),
//                         minX: 0,
//                         maxX: _myData
//                             .map((point) =>
//                                 Jiffy(point.data).dayOfYear.toDouble())
//                             .reduce(max),
//                         maxY: _returnMaxY(_myData),
//                         borderData: FlBorderData(
//                             border: const Border(
//                                 bottom: BorderSide(), left: BorderSide())),
//                         gridData: FlGridData(
//                           show: showGrid,
//                           drawHorizontalLine: true,
//                           drawVerticalLine: true,
//                           getDrawingHorizontalLine: (value) {
//                             return FlLine(
//                               color: Colors.grey,
//                               strokeWidth: 1,
//                             );
//                           },
//                           getDrawingVerticalLine: (value) {
//                             return FlLine(
//                               color: Colors.grey,
//                               strokeWidth: 1,
//                             );
//                           },
//                           horizontalInterval: _returnMaxY(_myData) / 5,
//                           verticalInterval: 365 / 6,
//                         ),
//                         titlesData: FlTitlesData(
//                           bottomTitles: _bottomTitles(_myData, year),
//                           leftTitles: _leftTitles(_myData),
//                           topTitles: SideTitles(showTitles: false),
//                           rightTitles: SideTitles(showTitles: false),
//                         )),
//                     swapAnimationDuration: Duration(seconds: 30),
//                     swapAnimationCurve: Curves.bounceInOut,
//                   );
//                 } else {
//                   return Container(
//                       child: Center(child: CircularProgressIndicator()));
//                 }
//               }),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 60, top: 20),
//             child: Row(
//               children: [
//                 Container(
//                   width: 170,
//                   height: 20,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         color: Colors.purple,
//                         height: 10,
//                         width: 10,
//                       ),
//                       Container(
//                         child: Text("Alimentação"),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// SideTitles _bottomTitles(List<InvestmentItem> data, int year) {
//   double values =
//       data.map((point) => Jiffy(point.data).dayOfYear).reduce((max)) / 6;
//   print(values);
//   return SideTitles(
//       showTitles: true,
//       reservedSize: 22,
//       textAlign: TextAlign.right,
//       margin: 20,
//       interval: values,
//       getTextStyles: (context, value) => const TextStyle(
//             color: Colors.blueGrey,
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//       getTitles: (value) {
//         return value.round().toString();
//       }
//       //   if (values > 6) {
//       //     switch (value.toInt()) {
//       //       case 0:
//       //         return 'Jn';
//       //       case 1:
//       //         return 'Fv';
//       //       case 2:
//       //         return 'Mr';
//       //       case 3:
//       //         return 'Ab';
//       //       case 4:
//       //         return 'Ma';
//       //       case 5:
//       //         return 'Jn';
//       //       case 6:
//       //         return 'Jl';
//       //       case 8:
//       //         return 'Ag';
//       //       case 9:
//       //         return 'St';
//       //       case 10:
//       //         return 'Ot';
//       //       case 11:
//       //         return 'Nv';
//       //       case 12:
//       //         return 'Dz';
//       //     }
//       //     return '';
//       //   }
//       //   if (values > 3) {
//       //     switch (value.toInt()) {
//       //       case 1:
//       //         return 'Jan';
//       //       case 2:
//       //         return 'Fev';
//       //       case 3:
//       //         return 'Mar';
//       //       case 4:
//       //         return 'Abr';
//       //       case 5:
//       //         return 'Mar';
//       //       case 6:
//       //         return 'Jun';
//       //       case 7:
//       //         return 'Jul';
//       //       case 8:
//       //         return 'Ago';
//       //       case 9:
//       //         return 'Set';
//       //       case 10:
//       //         return 'Out';
//       //       case 11:
//       //         return 'Nov';
//       //       case 12:
//       //         return 'Dez';
//       //     }
//       //     return '';
//       //   }
//       //   if (values <= 3) {
//       //     switch (value.toInt()) {
//       //       case 0:
//       //         return "";
//       //       case 1:
//       //         return 'Dia 1';
//       //       case 2:
//       //         return '2';
//       //       case 3:
//       //         return '3';
//       //       case 4:
//       //         return '4';
//       //       case 5:
//       //         return '5';
//       //       case 6:
//       //         return '6';
//       //       case 7:
//       //         return '7';
//       //       case 8:
//       //         return '7';
//       //       case 9:
//       //         return 'Set ${year}';
//       //       case 10:
//       //         return 'Out ${year}';
//       //       case 11:
//       //         return 'Nov ${year}';
//       //       case 12:
//       //         return 'Dez ${year}';
//       //       case 13:
//       //         return 'Dez ${year}';
//       //       case 14:
//       //         return 'Dez ${year}';
//       //       case 15:
//       //         return 'Dez ${year}';
//       //       case 16:
//       //         return 'Dez ${year}';
//       //       case 17:
//       //         return 'Dez ${year}';
//       //       case 18:
//       //         return 'Dez ${year}';
//       //       case 19:
//       //         return 'Dez ${year}';
//       //       case 20:
//       //         return 'Dez ${year}';
//       //       case 21:
//       //         return 'Dez ${year}';
//       //       case 22:
//       //         return 'Dez ${year}';
//       //       case 23:
//       //         return 'Dez ${year}';
//       //       case 24:
//       //         return 'Dez ${year}';
//       //       case 25:
//       //         return 'Dez ${year}';
//       //       case 26:
//       //         return 'Dez ${year}';
//       //       case 27:
//       //         return 'Dez ${year}';
//       //       case 28:
//       //         return 'Dez ${year}';
//       //       case 29:
//       //         return 'Dez ${year}';
//       //       case 30:
//       //         return 'Dez ${year}';
//       //       case 31:
//       //         return 'Dez ${year}';
//       //     }
//       //     return '';
//       //   }
//       //   return "";
//       // },
//       );
// }
//
// class InvestmentItem {
//   DateTime data;
//   num cotaCDI;
//   num cotaCarteira;
//   num cotaIpca;
//
//   InvestmentItem({
//     required this.cotaCarteira,
//     required this.cotaCDI,
//     required this.cotaIpca,
//     required this.data,
//   });
//
//   factory InvestmentItem.fromJson(Map<String, dynamic> parsedJson) {
//     return InvestmentItem(
//       data: DateTime.parse(parsedJson['data']),
//       cotaCarteira: parsedJson['cotaCarteira'],
//       cotaCDI: parsedJson['cotaCDI'],
//       cotaIpca: parsedJson['cotaIpca'],
//       //barColor:parsedJson['barColor'].toString(),
//     );
//   }
// }
//
// SideTitles _leftTitles(List<InvestmentItem> data) {
//   double values =
//       data.map((point) => point.cotaCarteira.toDouble()).reduce(max) / 2;
//   String preciseValue = values.toStringAsPrecision(1);
//   double realValues = double.parse(preciseValue);
//   return SideTitles(
//     showTitles: true,
//     reservedSize: 50,
//     margin: 0,
//     interval: values,
//     getTextStyles: (context, value) => const TextStyle(
//       color: Colors.blueGrey,
//       fontWeight: FontWeight.bold,
//       fontSize: 15,
//     ),
//   );
// }
