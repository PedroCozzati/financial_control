// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../../data/datasource/coffee.datasource.dart';
// import '../../data/models/coffee.model.dart';
// import '../../domain/errors/default.failure.dart';
//
// class CoffeeDatasourceImpl implements ICoffeeDataSource {
//
//   @override
//   Future<CoffeeModel> getCoffee() async {
//     try {
//       final result =
//       await http.get(Uri.parse('https://coffee.alexflipnote.dev/random.json'));
//       var decodedJson = jsonDecode(result.body);
//
//       if (result.statusCode == 200 || result.statusCode == 201) {
//         return CoffeeModel.fromJson(decodedJson);
//       }
//     } catch (e) {
//       CoffeeDatasourceError(
//           'Erro');
//     }
//
//     throw CoffeeDatasourceError(
//         'Erro');
//   }
// }
