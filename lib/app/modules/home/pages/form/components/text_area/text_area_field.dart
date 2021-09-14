import 'package:flutter/material.dart';
import '../../../../domain/entities/entities.dart';

class TextAreaField extends StatelessWidget {
  final Pergunta pergunta;
  final void Function(String) onValueChange;

  const TextAreaField({
    Key? key,
    required this.pergunta,
    required this.onValueChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        enabled: isEnabled(),
        decoration: InputDecoration(
          labelText: pergunta.nome,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  bool isEnabled() {
  if (pergunta.desabilitado == null) {
    return true;
  } else if (pergunta.desabilitado == 'false') {
    return true;
  } else {
    return false;
  }
}
}