import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../../../common/colors/colors.dart';
import '../../../common/database/database_controller.dart';
import '../../splash_screen/presentation/splash_screen.page.dart';
import '../../widgets/custom_text/custom_text.dart';
import '../historic/domain/category.entity.dart';
import '../historic/domain/event.entity.dart';

class AddEventForm extends StatefulWidget {
  @override
  _AddEventFormState createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  int timeStamp = 0;
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
  String _categorySelected = '';
  String _typeSelected = 'Débito';
  DateTime? pickedDate;

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
        });
      },
    );
  }

  Widget _buildEventType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 110,
        decoration: BoxDecoration(
          color: _typeSelected == title
              ? CustomColors.primaryGreen
              : CustomColors.primaryYellow,
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
            'Adicionar movimentação',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              //autovalidate: _validate,
              child: _formUI(),
            ),
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
            SizedBox(height: 55),
            TextFormField(
              cursorColor: CustomColors.secundaryRed,
              controller: _valueController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
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
                hintText: 'Digite uma descrição (opcional)',
                prefixIcon: Icon(
                  Icons.info,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
              validator: (val) {
                // if (val!.isEmpty) {
                //   return "Descrição não";
                // } else {
                //   return null;
                // }
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
                  prefixIcon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Selecione a data" //label text of field
                  ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate!);

                  setState(() {
                    _dateController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
              validator: (val) {
                if (pickedDate == null) {
                  return "Data não pode ser nula";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 55),
            Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    color: CustomColors.primayRed,
                    text: 'Escolha a categoria',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textAlign: null,
                  ),
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildEventType('Receita'),
                              _buildEventType('Débito')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 55),
            Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    color: CustomColors.primayRed,
                    text: 'Escolha a categoria',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textAlign: null,
                  ),
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Visibility(
                          child: _buildEventCategory(category.alimentacao),
                          visible: _typeSelected != "Receita",
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected != "Receita",
                          child: _buildEventCategory(category.lazer),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected != "Receita",
                          child: _buildEventCategory(category.aluguel),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected != "Receita",
                          child: _buildEventCategory(category.viagem),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected != "Receita",
                          child: _buildEventCategory(category.compras),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected != "Receita",
                          child: _buildEventCategory(category.saude),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected != "Receita",
                          child: _buildEventCategory(category.contas),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected != "Receita",
                          child: _buildEventCategory(category.outros),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected == "Receita",
                          child: _buildEventCategory(category.outrosReceita),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected == "Receita",
                          child: _buildEventCategory(category.aluguelReceita),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _typeSelected == "Receita",
                          child: _buildEventCategory(category.contasReceita),
                        ),
                      ],
                    ),
                  ),
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
                  // if(pickedDate!=null) {
                  //
                  // }
                  if (_key.currentState!.validate()) {
                    DateTime date =
                        DateFormat('dd-MM-yyyy').parse(_dateController.text);
                    timeStamp = date.millisecondsSinceEpoch;
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

  void saveContact() {
    String value = _valueController.text;
    String description = _descriptionController.text;
    String date = _dateController.text;

    EventEntity2 event = EventEntity2(
        type: _typeSelected,
        description: description,
        date: date,
        value: value,
        category: _categorySelected);

    Map<String, String> contact = {
      'value': event.value,
      'description': event.description,
      'type': event.type,
      'category': event.category,
      'date': event.date,
      'timeStamp': timeStamp.toString(),
    };

    _ref.push().set(contact).then((value) {
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
