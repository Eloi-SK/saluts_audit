import 'package:mobx/mobx.dart';

import 'pergunta.dart';

class Agrupamento {
  final String id;
  final String nome;
  
  @observable
  final List<Pergunta> perguntas;
  
  Agrupamento({
    required this.id,
    required this.nome,
    required this.perguntas,
  });

  Agrupamento copyWith({
    String? id,
    String? nome,
    List<Pergunta>? perguntas,
  }) => 
    Agrupamento(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      perguntas: perguntas ?? this.perguntas,
    );

  factory Agrupamento.fromJson(Map<String, dynamic> json) => Agrupamento(
    id: json["id"],
    nome: json["nome"],
    perguntas: List<Pergunta>.from(json["perguntas"].map((x) => Pergunta.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "perguntas": List<dynamic>.from(perguntas.map((x) => x.toJson())),
  };
}