import 'package:financial_control/src/common/colors/colors.dart';
import 'package:financial_control/src/features/home/historic/controller/event_controller.dart';
import 'package:financial_control/src/model/event.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../main.dart';
import '../../../splash_screen/presentation/splash_screen.page.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../add_event/add_event.dart';
import '../../add_event/edit_event.dart';

class HistoricEvents extends StatefulWidget {
  @override
  _HistoricEventsState createState() => _HistoricEventsState();
}

class _HistoricEventsState extends State<HistoricEvents> {
  late Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child(userId).child('events');
  EventController eventController = EventController();
  late List eventList;
  final formatter =
      NumberFormat.simpleCurrency(locale: "pt_Br", decimalDigits: 2);

  late Future<bool> listIsEmpty;

  void retrieveStudentData() async {
    await reference.onChildAdded.listen((data) {
      print(data.snapshot.value.toString());
      EventData eventData = EventData.fromJson(data.snapshot.value as Map);
      EventEntity event =
          EventEntity(key: data.snapshot.key, eventData: eventData);
      eventList.add(event);
      print(event.eventData);
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveStudentData();

    _ref = FirebaseDatabase.instance
        .reference()
        .child(userId)
        .child('events')
        .orderByChild('timeStamp');
    //print(eventController.eventList);
  }

  Widget _buildContactItem({required Map event}) {
    // eventList = eventController.eventList;
    // contact.containsKey('value').forEach((key, value) {
    //   print(value.toString());
    // });
    List debits = [];
    // for (String value
    //     in contact.values.where((element) => element.contains('R\$'))) {
    //   // print(value.toString());
    //   print(value.toString());
    // }

    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateTime dateTime = dateFormat.parse(event['date'] ?? '');

    // Color typeColor = getTypeColor(contact['category']);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
      padding: EdgeInsets.all(20),
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Icon(
                  Icons.monetization_on_outlined,
                  color: CustomColors.primayRed,
                  size: 26,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "R\$ " + event['value'],
                  style: TextStyle(
                      fontSize: 20,
                      color: CustomColors.primayRed,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 15),
              ]),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: CustomColors.primayRed,
                    size: 26,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(dateTime),
                    style: TextStyle(
                        fontSize: 20,
                        color: CustomColors.primayRed,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.info,
                color: CustomColors.primayRed,
                size: 24,
              ),
              Text(
                event['description'],
                style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.primayRed,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            width: 700,
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: 'Tipo: ',
                            color: CustomColors.primayRed,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            textAlign: null,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: event['type'] == "Receita"
                                    ? Color(0xff64c76d)
                                    : Colors.redAccent),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              child: Text(
                                event['type'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            text: 'Categoria: ',
                            color: CustomColors.primayRed,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            textAlign: null,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffc7b864)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              child: Text(
                                event['category'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xff9d8e32), width: 0.9)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditEventForm(
                                      contactKey: event['key'],
                                    )));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Color(0xffa39331),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text('Edit',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff756922),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  )),
              SizedBox(width: 40,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.red, width: 0.9)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _showDeleteDialog(event: event);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red[700],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('Delete',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.red[700],
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // getCategoryNames(Map event) {
  //   switch (event['category']) {
  //     case "Contas +":
  //       return "Contas";
  //     case "Aluguel +":
  //       return "Aluguel";
  //     case "Outros +":
  //       return "Outros";
  //     case "Contas ":
  //       return "Contas";
  //     case "Aluguel ":
  //       return "Aluguel";
  //     case "Lazer ":
  //       return "Lazer";
  //     case "Alimentacão ":
  //       return "Alimentação";
  //     case "Outros ":
  //       return "Outros";
  //     case "Viagem ":
  //       return "Viagem";
  //     case "Compras":
  //       return "Compras";
  //     case "Saúde ":
  //       return "Saúde";
  //     default:
  //       return "";
  //   }
  // }

  _showDeleteDialog({required Map event}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: Text(
                'Tem certeza que quer deletar a movimentação registrada no dia ${event['date']} ?'),
            content: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                        color: Colors.green.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Valor: R\$ ${event['value']}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Card(
                        color: Colors.green.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Descrição: ${event['description']}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Card(
                        color: Colors.green.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Tipo: ${event['type']}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Card(
                        color: Colors.green.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Categoria: ${event['category']}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                )),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 18),
                  )),
              FlatButton(
                  onPressed: () {
                    reference
                        .child(event['key'].toString())
                        .remove()
                        .whenComplete(() => Navigator.pop(context));
                  },
                  child: Text(
                    'Deletar',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          );
        });
  }

  void createData(String id, String value, String name) {
    reference.child('events').set({'value': value});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      eventList = eventController.eventList;
    });
    eventList = eventController.eventList;
    listIsEmpty = Future.delayed(Duration(seconds: 1))
        .then((value) => value = eventList.isEmpty);
    return Container(
        height: double.infinity,
        child: FutureBuilder(
          future: listIsEmpty,
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: Container(
                      child: Container(
                          height: 120,
                          child: Lottie.asset(
                              'lib/assets/loading_animation/loading_on_app.json'))));
            } else if (snapshot.data == false) {
              return
                  //   ListView(
                  //   children: [
                  //     for (int i = 0; i < eventList.length; i++)
                  //
                  //       _buildContactItem(event: eventList[i])
                  //   ],
                  // );
                  Align(
                      alignment: Alignment.topCenter,
                      child: FirebaseAnimatedList(
                        duration: Duration(milliseconds: 600),
                        shrinkWrap: true,
                        reverse: true,
                        query: _ref,
                        itemBuilder: (BuildContext context,
                            DataSnapshot snapshot,
                            Animation<double> animation,
                            int index) {
                          Map contact = snapshot.value;
                          contact['key'] = snapshot.key;
                          return _buildContactItem(event: contact);
                        },
                      ));
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Parece que você ainda não tem nenhuma movimentação registrada\n\n\n\n\n\n\nClique no botão abaixo para adicionar movimentações",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.arrow_downward,
                    size: 59,
                  )
                ],
              );
            }
          },
        ));
  }

  // listIsEmpty
  //     ? Center(
  //         child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Container(
  //             child: Text(
  //               "Parece que você ainda não tem nenhuma movimentação registrada\n\n\n\n\n\n\nClique no botão abaixo para adicionar movimentações",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontSize: 21),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 30,
  //           ),
  //           Icon(
  //             Icons.arrow_downward,
  //             size: 59,
  //           )
  //         ],
  //       ))
  //     : ListView(
  //         children: [
  //           for (int i = 0; i < eventList.length; i++)
  //             _buildContactItem(event: eventList[i])
  //         ],
  //       ),
  // child: Align(
  //   alignment: Alignment.topCenter,
  //   child: baseAnimatedList(Fire
  //     shrinkWrap: true,
  //     reverse: true,
  //     query: _ref,
  //     itemBuilder: (BuildContext context, DataSnapshot snapshot,
  //         Animation<double> animation, int index) {
  //       Map contact = snapshot.value;
  //       contact['key'] = snapshot.key;
  //       return _buildContactItem(contact: contact);
  //     },
  //   ),
  // ),

  Widget studentWidget(EventEntity eventEntity) {
    return InkWell(
      onTap: () {
        // _edtNameController.text = student.studentData!.name!;
        // _edtAgeController.text = student.studentData!.age!;
        // _edtSubjectController.text = student.studentData!.subject!;
        // updateStudent = true;
        // studentDialog(key: student.key);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(eventEntity.eventData!.value!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color getTypeColor(String type) {
    Color color = Theme.of(context).accentColor;

    if (type == 'Work') {
      color = Colors.brown;
    }

    if (type == 'Family') {
      color = Colors.green;
    }

    if (type == 'Friends') {
      color = Colors.teal;
    }
    return color;
  }
}
