class Resposta {
  final String nome;
  final List<String>? habilitaCampos;

  Resposta({
      required this.nome,
      this.habilitaCampos,
  });

  factory Resposta.fromJson(Map<String, dynamic> json) => Resposta(
      nome: json["nome"],
      habilitaCampos: json["habilita_campos"] == null ? null : List<String>.from(json["habilita_campos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
      "nome": nome,
      "habilita_campos": habilitaCampos == null ? null : List<dynamic>.from(habilitaCampos!.map((x) => x)),
  };
}