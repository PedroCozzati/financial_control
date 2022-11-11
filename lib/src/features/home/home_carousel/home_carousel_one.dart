import 'dart:io';

import 'package:flutter/material.dart';

import '../../../common/colors/colors.dart';
import '../../widgets/custom_text/custom_text.dart';
import 'package:path_provider/path_provider.dart';

class HomeCarouselOne extends StatefulWidget {
  const HomeCarouselOne({Key? key}) : super(key: key);

  @override
  State<HomeCarouselOne> createState() => _HomeCarouselOneState();
}

class _HomeCarouselOneState extends State<HomeCarouselOne> {

  late String data;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<String> readContent() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      // Returning the contents of the file
      return contents;
    } catch (e) {
      // If encountering an error, return
      return 'Error!';
    }
  }

  Future<File> writeContent() async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('R\$299,99');
  }

  Future<File> writeData(String data) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString(data);
  }

  @override
  void initState() {
    super.initState();
    writeContent();
    readContent().then((String value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        height: 400,
        color: CustomColors.secondaryBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  fontSize: 18,
                  text: 'Saldo Atual',
                  color: CustomColors.primaryWhite,
                  fontWeight: null,
                ),

                Row(
                  children: [
                    Text("Mês"),
                    Container(
                      height: 20,
                      width: 50,
                      color: CustomColors.primaryWhite,
                    ),
                  ],
                ),
              ],
            ),
            Text(data),
            Text("Gastos"),
            Text("R\$ 300,00"),
            Container(
              height: 20,
              color: CustomColors.primaryWhite,
            ),
            Container(
              height: 20,
              color: CustomColors.primaryWhite,
            ),
          ],
        ),
      ),
    );
  }
}
