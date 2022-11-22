import 'package:flutter/material.dart';

class CategoryEntity {
  final String alimentacao = "Alimentacão -";
  final String lazer = "Lazer -";
  final String saude = "Saúde -";
  final String compras = "Compras -";
  final String viagem = "Viagem -";
  final String aluguel = "Aluguel -";
  final String contas = "Contas -";
  final String outros = "Outros -";
  final String aluguelReceita = "Aluguel +";
  final String contasReceita = "Contas +";
  final String outrosReceita = "Outros +";

  returnDebitCategories() {
    return [
      alimentacao,
      lazer,
      saude,
      compras,
      viagem,
      aluguel,
      contas,
      outros,
    ];
  }

  returnCreditCategories() {
    return [
      aluguel,
      contas,
      outros,
    ];
  }

  getColorByCategory(String category) {
    switch (category) {
      case "Aluguel -":
        return Colors.redAccent;
      case "Outros -":
        return Colors.orange;
      case "Contas -":
        return Colors.red.shade900;
      case "Viagem -":
        return Colors.deepOrange;
      case "Compras -":
        return Colors.red.shade300;
      case "Saúde -":
        return Colors.orangeAccent;
      case "Lazer -":
        return Colors.pink;
      case "Alimentação -":
        return Colors.purpleAccent;
      case "Aluguel +":
        return Colors.greenAccent;
      case "Outros +":
        return Colors.green;
      case "Contas +":
        return Colors.lightGreenAccent;
    }
  }
}
