import 'package:financial_control/src/model/category.entity.dart';
import 'package:financial_control/src/model/event.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../../../common/colors/colors.dart';
import '../../../common/database/database_controller.dart';
import '../../splash_screen/presentation/splash_screen.page.dart';
import '../../widgets/custom_text/custom_text.dart';

class EditEventForm extends StatefulWidget {
  final String? contactKey;

  EditEventForm({this.contactKey});

  @override
  _EditEventFormState createState() => _EditEventFormState();
}

class _EditEventFormState extends State<EditEventForm> {
  int timeStamp = 0;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  static const _locale = 'pt_br';
  late String valor, email, celular;
  Categories category = Categories();
  DatabaseController databaseController = DatabaseController();
  bool isCredit = false;
  late MoneyMaskedTextController _valueController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoryController;
  late TextEditingController _dateController;
  late TextEditingController _typeController;
  String _categorySelected = '';
  String _typeSelected = '';
  DateTime? pickedDate;

  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));

  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  late DatabaseReference _ref;
  late FormState formState;
  bool isVisible = true;
  bool msgErrorIsVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msgErrorIsVisible = false;
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
        width: 120,
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
                hintText: 'Edite o valor',
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
                hintText: 'Edite sua descrição',
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
                  labelText: "Edite a data" //label text of field
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
                    text: 'Edite o tipo da movimentação',
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
                              _buildEventType('Despesas')
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
                  _typeSelected.isNotEmpty
                      ? CustomText(
                          color: CustomColors.primayRed,
                          text: 'Edite a categoria',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          textAlign: null,
                        )
                      : Container(),
                  Container(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _typeSelected == "Receita"
                          ? category.getCreditCategories().length
                          : category.getDebitCategories().length,
                      itemBuilder: (BuildContext context, int index) {
                        return _typeSelected.isNotEmpty
                            ? _typeSelected == "Receita"
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: _buildEventCategory(
                                        category.getCreditCategories()[index]),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: _buildEventCategory(
                                        category.getDebitCategories()[index]),
                                  )
                            : Container();
                        //       category.alimentacao);
                      },
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
        isVisible
            ? Column(
                children: [
                  Visibility(
                    visible: msgErrorIsVisible,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0x42c7646c),
                        border: Border.all(color: Colors.black54, width: 0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(27.0),
                        child: Text(
                          "Dica: O formulário não pode ser salvo se o tipo e a categoria não estiverem selecionados",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
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
                          DateTime date = DateFormat('dd-MM-yyyy')
                              .parse(_dateController.text);
                          timeStamp = date.millisecondsSinceEpoch;
                          if (_typeSelected != '' && _categorySelected != '') {
                            isVisible = false;
                            saveContact();
                          }
                          //msgErrorIsVisible = true;
                          setState(() {
                            msgErrorIsVisible = true;
                          });
                        }
                      },
                      color: CustomColors.primayRed,
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator()
      ],
    );
  }

  void saveContact() {
    String value = _valueController.text;
    String description = _descriptionController.text;
    String date = _dateController.text;

    EventData event = EventData(
        type: _typeSelected,
        description: description,
        date: date,
        value: value,
        category: _categorySelected);

    Map<String, String> contact = {
      'value': event.value!,
      'description': event.description!,
      'type': event.type!,
      'category': event.category!,
      'date': event.date!,
      'timeStamp': timeStamp.toString(),
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
