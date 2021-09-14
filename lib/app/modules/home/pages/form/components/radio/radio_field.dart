import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/entities/entities.dart';

import 'radio_store.dart';

class RadioField extends StatelessWidget {
  final Pergunta pergunta;
  final void Function(String) onValueChange;

  final store = Modular.get<RadioStore>();

  RadioField({
    Key? key,
    required this.pergunta,
    required this.onValueChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pergunta.nome),
              ...pergunta.respostas!.map((el) {
                return Row(
                  children: [
                    Radio(
                      value: el.nome,
                      groupValue: store.value,
                      onChanged: (String? v) => store.setValue(v!),
                    ),
                    Text(el.nome)
                  ],
                );
              })
            ],
          ),
        );
      }
    );
  }
}