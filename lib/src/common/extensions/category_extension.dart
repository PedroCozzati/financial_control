import 'package:flutter/material.dart';


  getColorByCategory(String category, String type) {
    if (type == "Despesas") {
      switch (category) {
        case "Aluguel":
          return Color(0xfe671429);
        case "Outros":
          return Color(0xfe50156e);
        case "Contas":
          return Color(0xfee7103b);
        case "Viagem":
          return Color(0xfead5f6c);
        case "Compras":
          return Color(0xfeff9239);
        case "Saúde":
          return Color(0xfeffc400);
        case "Lazer":
          return Color(0xfadb166b);
        case "Alimentacão":
          return Color(0xc6ffd795);
      }
    }
    else {
      switch (category) {
        case "Aluguel":
          return Color(0xfe82f3c1);
        case "Outros":
          return Color(0xfe477132);
        case "Contas":
          return Color(0xfe31a159);
        case "Salário":
          return Color(0xfe9cd21a);
      }
    }
  }
