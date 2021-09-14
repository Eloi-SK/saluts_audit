import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';

class TimeField extends StatelessWidget {
  final Pergunta pergunta;
  final void Function(String) onValueChange;

  const TimeField({
    Key? key,
    required this.pergunta,
    required this.onValueChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            Text(pergunta.nome),
            ElevatedButton(
              onPressed: () async {
                final selected = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (selected != null) {
                  onValueChange(selected.format(context));
                }
              },
              child: pergunta.valor!.isEmpty
                ? Text('Selecionar')
                : Text(pergunta.valor!),
            ),
          ]
        ),
      ],
    );
  }
}