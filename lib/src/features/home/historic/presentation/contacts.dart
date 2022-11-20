import 'package:financial_control/src/common/colors/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../main.dart';
import '../../../splash_screen/presentation/splash_screen.page.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../add_event/add_event.dart';
import '../../add_event/edit_event.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  late Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child(userId).child('events');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child(userId).child('events').orderByChild('timeStamp');

  }

  Widget _buildContactItem({required Map contact}) {
    // contact.containsKey('value').forEach((key, value) {
    //   print(value.toString());
    // });
    List debits = [];
    for(String value in contact.values.where((element) => element.contains('R\$'))){
     // print(value.toString());
     print(value.toString());

    }

    DateFormat dateFormat = DateFormat('dd-MM-yyyy');

    DateTime dateTime = dateFormat.parse(contact['date']);

    print(debits.length);
    Color typeColor = getTypeColor(contact['category']);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
          color: CustomColors.fourthRed,
          borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      height: 200,
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
                  contact['value'],
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
                    Icons.calendar_month,
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
                contact['description'],
                style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.primayRed,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(text:'Tipo: ',color: CustomColors.primayRed,fontSize: 15,fontWeight: FontWeight.bold,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff64c76d)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                      child: Text(
                        contact['type'],
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  CustomText(text:'Categoria: ',color: CustomColors.primayRed,fontSize: 15,fontWeight: FontWeight.bold,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffc7b864)
                    ),
                    child: Padding(

                      padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                      child: Text(
                        contact['category'],
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EditEventForm(
                                contactKey: contact['key'],
                              )));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Color(0xff756922),
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
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  _showDeleteDialog(contact: contact);
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
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }

  _showDeleteDialog({required Map contact}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete ${contact['date']}'),
            content: Text('Are you sure you want to delete?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              FlatButton(
                  onPressed: () {
                    reference
                        .child(contact['key'])
                        .remove()
                        .whenComplete(() => Navigator.pop(context));
                  },
                  child: Text('Delete'))
            ],
          );
        });
  }

  void createData(String id, String value, String name) {
    reference.child('events').set({'value': value});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Align(
        alignment: Alignment.topCenter,
        child: FirebaseAnimatedList(
          shrinkWrap: true,
          reverse: true,
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            contact['key'] = snapshot.key;
            return _buildContactItem(contact: contact);
          },
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
