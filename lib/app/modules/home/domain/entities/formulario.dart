class Formulario {
  final int id;
  final int idade;
  final String chQuestionario;
  final DateTime prazoResposta;
  final String versao;
  //final List<Agrupamento> agrupamentos;
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
    required this.sexo,
    required this.beneficiario,
    required this.chAgendamento,
    required this.nome,
    required this.hospital,
    required this.baseOrigem,
    required this.agendamento,
    required this.operadora,
  });

  factory Formulario.fromJson(Map<String, dynamic> json) {
    return Formulario(
      id: int.parse(json['id']),
      idade: int.parse(json['idade']),
      chQuestionario: json['chQuestionario'],
      prazoResposta: DateTime.parse(json['prazoResposta']),
      versao: json['versao'],
      sexo: json['sexo'],
      beneficiario: json['beneficiario'],
      chAgendamento: json['chAgendamento'],
      nome: json['nome'],
      hospital: json['hospital'],
      baseOrigem: json['baseOrigem'],
      agendamento: DateTime.parse(json['agendamento']),
      operadora: json['operadora']
    );
  }
}