import 'package:flutter/material.dart';

class CategoryEntity {
  final String alimentacao = "Alimentacão";
  final String lazer = "Lazer";
  final String saude = "Saúde";
  final String compras = "Compras";
  final String viagem = "Viagem";
  final String aluguel = "Aluguel";
  final String contas = "Contas";
  final String outros = "Outros";

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
      case "Aluguel":
        return Colors.red;
      case "Outros":
        return Colors.blueGrey;
      case "Contas":
        return Colors.greenAccent;
      case "Viagem":
        return Colors.yellow;
      case "Compras":
        return Colors.deepPurple;
      case "Saúde":
        return Colors.orangeAccent;
      case "Lazer":
        return Colors.indigoAccent;
      case "Alimentação":
        return Colors.brown;
    }
  }
}
