import 'dart:collection';

class LivroModel {

  LivroModel({
    required this.id,
    required this.titulo,
    this.descricao = " ",
    this.lido = false,
  });

  int id;
  String titulo;
  String descricao;
  bool lido;

  @override
  bool operator ==(Object o) => o is LivroModel && id == o.id;

  @override
  int get hashCode => id;

  @override
  String toString() {
    return "LivroModel: título: $titulo, descrição: $descricao, lido: $lido";
  }

}
