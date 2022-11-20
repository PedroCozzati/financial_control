class CategoryEntity {
  final String alimentacao = "Alimentacão";
  final String lazer = "Lazer";
  final String saude = "Saúde";
  final String compras = "Compras";
  final String viagem = "Viagem";
  final String aluguel = "Aluguel";
  final String contas =  "Contas";
  final String outros = "Outros";

  returnDebitCategories(){
    return [
      alimentacao,lazer,saude,compras,viagem,aluguel,contas,outros,
    ];
  }

  returnCreditCategories(){
    return [
      aluguel,contas,outros,
    ];
  }
}
