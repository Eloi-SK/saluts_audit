import 'package:mobx/mobx.dart';

import 'resposta.dart';

class Pergunta {
  final String id;
  final Tipo tipo;

  @observable
  final String? valor;
  final String nome;
  final List<Resposta>? respostas;
  final String? desabilitado;

  @observable
  final List<String>? valores;
  final String? minimo;
  final String? maximo;
  
  Pergunta({
    required this.id,
    required this.tipo,
    required this.valor,
    required this.nome,
    this.respostas,
    required this.desabilitado,
    this.valores,
    this.minimo,
    this.maximo,
  });

  Pergunta copyWith({
    String? id,
    Tipo? tipo,
    String? valor,
    String? nome,
    List<Resposta>? respostas,
    String? desabilitado,
    List<String>? valores,
    String? minimo,
    String? maximo,
  }) => 
    Pergunta(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      valor: valor ?? this.valor,
      nome: nome ?? this.nome,
      respostas: respostas ?? this.respostas,
      desabilitado: desabilitado ?? this.desabilitado,
      valores: valores ?? this.valores,
      minimo: minimo ?? this.minimo,
      maximo: maximo ?? this.maximo,
    );

  factory Pergunta.fromJson(Map<String, dynamic> json) => Pergunta(
    id: json["id"],
    tipo: tipoValues.map[json["tipo"]]!,
    valor: json["valor"],
    nome: json["nome"],
    respostas: json["respostas"] == null ? null : List<Resposta>.from(json["respostas"].map((x) => Resposta.fromJson(x))),
    desabilitado: json["desabilitado"] == null ? null : json["desabilitado"],
    valores: json["valores"] == null ? null : List<String>.from(json["valores"].map((x) => x)),
    minimo: json["minimo"],
    maximo: json["maximo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipo": tipoValues.reverse![tipo],
    "valor": valor,
    "nome": nome,
    "respostas": respostas == null ? null : List<dynamic>.from(respostas!.map((x) => x.toJson())),
    "desabilitado": desabilitado,
    "valores": valores == null ? null : List<dynamic>.from(valores!.map((x) => x)),
    "minimo": minimo,
    "maximo": maximo,
  };
}

enum Tipo { HRP, DATA, HORA, COMBO, MEMO, MULTICOMBO, TEXTO }

final tipoValues = EnumValues({
  "combo": Tipo.COMBO,
  "data": Tipo.DATA,
  "hora": Tipo.HORA,
  "hrp": Tipo.HRP,
  "memo": Tipo.MEMO,
  "multicombo": Tipo.MULTICOMBO,
  "texto": Tipo.TEXTO
});

class EnumValues<T> {
  final Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
      if (reverseMap == null) {
          reverseMap = map.map((k, v) => new MapEntry(v, k));
      }
      return reverseMap;
  }
}