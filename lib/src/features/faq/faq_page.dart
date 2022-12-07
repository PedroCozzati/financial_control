import 'package:financial_control/src/features/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List textList = [
    'Qual é a função desse App ?',
    'É possível visualizar minhas movimentaçōes financeiras de acordo com um período ?',
    'É possível editar ou deletar um registro de movimentação ?',
    'O App realiza movimentaçōes financeiras ?',
  ];
  List contentList = [
    'Esse aplicativo tem como função auxiliar as pessoas que estão dispostas a controlar suas finanças, oferecendo relatórios, histórico de movimentaçōes financeiras, e um gráfico contendo a porcentagem de movimentaçōes por categoria',
    'Sim, o aplicativo oferece a opção de selecionar o mês e o ano na página inicial, sendo assim o usuário pode observar quanto ele ganha, quanto ele gasta, e o seu saldo em cada mês',
    'Sim, e esse registro automaticamente será modificado/deletado no relatório e no gráfico na página inicial',
    'Não, o App não realiza movimentaçōes, essas movimentaçōes devem ser inseridas manualmente pelo usuário',
  ];
  int? _activeMeterIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'FAQ - Sessão de ajuda ao usuário',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
          ),
          Expanded(
            child: Container(
              height: 300,
              child: new ListView.builder(
                  itemCount: textList.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Card(
                      margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                      child: new ExpansionPanelList(
                        expansionCallback: (int index, bool status) {
                          setState(() {
                            _activeMeterIndex = _activeMeterIndex == i ? null : i;
                          });
                        },
                        children: [
                          new ExpansionPanel(
                            isExpanded: _activeMeterIndex == i,
                            headerBuilder: (BuildContext context,
                                    bool isExpanded) =>
                                new Container(
                                    padding: const EdgeInsets.all(20),
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      textList[i],
                                    )),
                            body: new Container(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: new Text(contentList[i]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
