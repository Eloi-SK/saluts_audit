import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/entities.dart';

class DateField extends StatelessWidget {
  final Pergunta pergunta;
  final void Function(String) onValueChange;

  const DateField({
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
                final selected = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2022)
                );

                if (selected != null) {
                  onValueChange(DateFormat('yMd', 'pt_BR').format(selected));
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