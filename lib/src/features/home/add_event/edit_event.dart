import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../../../common/colors/colors.dart';
import '../../../common/database/database_controller.dart';
import '../../splash_screen/presentation/splash_screen.page.dart';
import '../historic/domain/category.entity.dart';
import '../historic/domain/event.entity.dart';

class EditEventForm extends StatefulWidget {
  final String contactKey;

  EditEventForm({required this.contactKey});

  @override
  _EditEventFormState createState() => _EditEventFormState();
}

class _EditEventFormState extends State<EditEventForm> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  static const _locale = 'en';
  late String valor, email, celular;
  CategoryEntity category = CategoryEntity();
  DatabaseController databaseController = DatabaseController();
  bool isCredit = false;
  late MoneyMaskedTextController _valueController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoryController;
  late TextEditingController _dateController;
  late TextEditingController _typeController;
  String _typeSelected = '';

  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));

  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  late DatabaseReference _ref;
  late FormState formState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _valueController = MoneyMaskedTextController(
        decimalSeparator: ',', thousandSeparator: '.');
    _descriptionController = TextEditingController();
    _categoryController = TextEditingController();
    _dateController = TextEditingController();
    _typeController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child(userId).child('events');
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 110,
        decoration: BoxDecoration(
          color: _typeSelected == title
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
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shadowColor: CustomColors.primayRed,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Editar movimentação',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          margin: new EdgeInsets.all(15.0),
          child: new Form(
            key: _key,
            //autovalidate: _validate,
            child: _formUI(),
          ),
        ),
      ),
    );
  }

  Widget _formUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: <Widget>[
            TextFormField(
              cursorColor: CustomColors.secundaryRed,
              controller: _valueController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              // Only num
              // onChanged: (string) {
              //   string = '${_formatNumber(string.replaceAll(',', ''))}';
              //   _valueController.value = TextEditingValue(
              //     text: string,
              //     selection: TextSelection.collapsed(offset: string.length),
              //   );
              // },
              decoration: InputDecoration(
                prefixText: _currency + " ",
                focusColor: CustomColors.secundaryRed,
                hoverColor: CustomColors.secundaryRed,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: 'Digite o valor',
                prefixIcon: Icon(
                  Icons.money,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return "O valor não pode estar vazio";
                }
                if (val == "0,00") {
                  return "O valor não pode estar zerado!";
                } else {
                  return null;
                }
              },
              onSaved: (String? val) {
                valor = val!;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              maxLines: 3,
              controller: _descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: 'Digite uma descrição',
                prefixIcon: Icon(
                  Icons.info,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: 'Enter Number',
                prefixIcon: Icon(
                  Icons.info,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _typeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hintText: 'Enter Number',
                prefixIcon: Icon(
                  Icons.info,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 55),
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Visibility(
                    child: _buildContactType(category.alimentacao),
                    visible: !isCredit,
                  ),
                  SizedBox(width: 10),
                  Visibility(
                    visible: !isCredit,
                    child: _buildContactType(category.lazer),
                  ),
                  SizedBox(width: 10),
                  _buildContactType(category.aluguel),
                  SizedBox(width: 10),
                  Visibility(
                    visible: !isCredit,
                    child: _buildContactType(category.viagem),
                  ),
                  SizedBox(width: 10),
                  Visibility(
                    visible: !isCredit,
                    child: _buildContactType(category.compras),
                  ),
                  SizedBox(width: 10),
                  Visibility(
                    visible: !isCredit,
                    child: _buildContactType(category.saude),
                  ),
                  SizedBox(width: 10),
                  _buildContactType(category.contas),
                  SizedBox(width: 10),
                  _buildContactType(category.outros),
                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    saveContact();
                  }
                },
                color: CustomColors.primayRed,
              ),
            ),
          ],
        )
      ],
    );
  }

  getContactDetail() async {
    DataSnapshot snapshot = await _ref.child(widget.contactKey).once();

    Map event = snapshot.value;

    _valueController.text = event['value'];

    _descriptionController.text = event['description'];

    setState(() {
      _typeSelected = event['type'];
    });
  }

  void saveContact() {
    String value = _valueController.text;
    String description = _descriptionController.text;
    String date = _dateController.text;
    String isCredit = _typeController.text;

    EventEntity event = EventEntity(
        type: _typeSelected,
        description: description,
        date: date,
        value: value,
        category: _typeSelected);

    Map<String, String> contact = {
      'value': event.value,
      'description': event.description,
      'isCredit': false.toString(),
      'category': event.category,
      'date': event.date,
    };

    _ref.child(widget.contactKey).update(contact).then((value) {
      Navigator.pop(context);
    });
  }

  String? _validarNome(String? value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String? _validarCelular(String? value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.length == 0) {
      return "Informe o celular";
    } else if (value.length != 10) {
      return "O celular deve ter 10 dígitos";
    } else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String? _validarEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  _sendForm() {
    if (_key.currentState!.validate()) {
      // Sem erros na validação
      _key.currentState!.save();
      print("Nome $valor");
      print("Ceclular $celular");
      print("Email $email");
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}
