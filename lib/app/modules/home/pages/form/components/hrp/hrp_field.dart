import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';

class HrpField extends StatelessWidget {
  final Pergunta pergunta;
  const HrpField({Key? key, required this.pergunta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Table(
        children: [
          TableRow(
            children: [
              Text(pergunta.nome),
              Text(pergunta.valor!),
            ]
          )
        ]
      ),
    );
  }
}