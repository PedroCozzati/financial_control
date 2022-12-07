import 'category.entity.dart';

class CategoryModel {
  final String alimentacao = "Alimentacão";
  final String lazer = "Lazer";
  final String saude = "Saúde";
  final String compras = "Compras";
  final String viagem = "Viagem";
  final String aluguel = "Aluguel";
  final String contas = "Contas";
  final String outros = "Outros";
  final String salario = "Salário";

  List getDebitCategories() {
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

  List getCreditCategories() {
    return [
      aluguel,
      contas,
      outros,
      salario
    ];
  }

  List getAllCategories(){
    return [
      alimentacao,
      lazer,
      saude,
      compras,
      viagem,
      aluguel,
      contas,
      outros,
      aluguel,
      contas,
      outros,
      salario
    ];
  }

}
