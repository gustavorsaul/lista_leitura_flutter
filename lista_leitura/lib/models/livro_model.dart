class LivroModel {

  LivroModel({
    required this.titulo,
    this.descricao = " ",
    this.lido = false,
  });

  String titulo;
  String descricao;
  bool lido;


}

final listaLivrosMock = [
  LivroModel(titulo: "Código Limpo", descricao: "Ótimo livro. Recomendo", lido: true),
  LivroModel(titulo: "C completo e total", lido: false),
  LivroModel(titulo: "JAVA: use a cabeça", descricao: "Livro bom", lido: true),
];