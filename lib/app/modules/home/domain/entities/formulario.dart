import 'package:mobx/mobx.dart';

import 'agrupamento.dart';

class Formulario {
  final String id;
  final String idade;
  final String chQuestionario;
  final DateTime prazoResposta;
  final String versao;
  
  @observable
  final List<Agrupamento> agrupamentos;
  final String sexo;
  final String beneficiario;
  final String chAgendamento;
  final String nome;
  final String hospital;
  final String baseOrigem;
  final DateTime agendamento;
  final String operadora;

  Formulario({
    required this.id,
    required this.idade,
    required this.chQuestionario,
    required this.prazoResposta,
    required this.versao,
    required this.agrupamentos,
    required this.sexo,
    required this.beneficiario,
    required this.chAgendamento,
    required this.nome,
    required this.hospital,
    required this.baseOrigem,
    required this.agendamento,
    required this.operadora,
  });

  Formulario copyWith({
    String? id,
    String? idade,
    String? chQuestionario,
    DateTime? prazoResposta,
    String? versao,
    List<Agrupamento>? agrupamentos,
    String? sexo,
    String? beneficiario,
    String? chAgendamento,
    String? nome,
    String? hospital,
    String? baseOrigem,
    DateTime? agendamento,
    String? operadora,
  }) => 
    Formulario(
      id: id ?? this.id,
      idade: idade ?? this.idade,
      chQuestionario: chQuestionario ?? this.chQuestionario,
      prazoResposta: prazoResposta ?? this.prazoResposta,
      versao: versao ?? this.versao,
      agrupamentos: agrupamentos ?? this.agrupamentos,
      sexo: sexo ?? this.sexo,
      beneficiario: beneficiario ?? this.beneficiario,
      chAgendamento: chAgendamento ?? this.chAgendamento,
      nome: nome ?? this.nome,
      hospital: hospital ?? this.hospital,
      baseOrigem: baseOrigem ?? this.baseOrigem,
      agendamento: agendamento ?? this.agendamento,
      operadora: operadora ?? this.operadora,
    );

  factory Formulario.fromJson(Map<String, dynamic> json) => Formulario(
    id: json["id"],
    idade: json["idade"],
    chQuestionario: json["chQuestionario"],
    prazoResposta: DateTime.parse(json["prazoResposta"]),
    versao: json["versao"],
    agrupamentos: List<Agrupamento>.from(json["agrupamentos"].map((x) => Agrupamento.fromJson(x))),
    sexo: json["sexo"],
    beneficiario: json["beneficiario"],
    chAgendamento: json["chAgendamento"],
    nome: json["nome"],
    hospital: json["hospital"],
    baseOrigem: json["baseOrigem"],
    agendamento: DateTime.parse(json["agendamento"]),
    operadora: json["operadora"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idade": idade,
    "chQuestionario": chQuestionario,
    "prazoResposta": prazoResposta.toIso8601String(),
    "versao": versao,
    "agrupamentos": List<dynamic>.from(agrupamentos.map((x) => x.toJson())),
    "sexo": sexo,
    "beneficiario": beneficiario,
    "chAgendamento": chAgendamento,
    "nome": nome,
    "hospital": hospital,
    "baseOrigem": baseOrigem,
    "agendamento": agendamento.toIso8601String(),
    "operadora": operadora,
  };
}