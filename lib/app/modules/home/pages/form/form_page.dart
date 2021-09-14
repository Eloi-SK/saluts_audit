import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/entities.dart';
import '../../home_store.dart';

import 'components/components.dart';

class FormPage extends StatefulWidget {
  final String id;
  const FormPage({ Key? key, required this.id }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final store = Modular.get<HomeStore>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 30,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: LinearProgressIndicator(
                value: 0.5,
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (store.forms.isEmpty) {
                  return Container();
                }

                final form = store.forms.firstWhere((form) => form.id == widget.id);
                return ListView.builder(
                  itemCount: form.agrupamentos.length,
                  itemBuilder: (context, index) {
                    final agrupamento = form.agrupamentos[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: buildFields(agrupamento)
                    );
                  }
                );
              },
            )
          )
        ],
      ),
    );
  }

  Widget buildFields(Agrupamento agrupamento) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              agrupamento.nome,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Divider(),
            ...agrupamento.perguntas.map((i) {
              return QuestionField(
                pergunta: i,
                onValueChange: (newValue) {
                  store.changeValue(widget.id, agrupamento.id, i.id, newValue);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

class QuestionField extends StatelessWidget {
  final Pergunta pergunta;
  final void Function(String) onValueChange;
  const QuestionField({
    Key? key,
    required this.pergunta,
    required this.onValueChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (pergunta.tipo) {
      case Tipo.HRP:
        return HrpField(pergunta: pergunta);
      case Tipo.DATA:
        return DateField(
          pergunta: pergunta,
          onValueChange: onValueChange
        );
      case Tipo.HORA:
        return TimeField(
          pergunta: pergunta,
          onValueChange: onValueChange,
        );
      case Tipo.COMBO:
        return RadioField(
          pergunta: pergunta,
          onValueChange: onValueChange,
        );
      case Tipo.MEMO:
        return TextAreaField(
          pergunta: pergunta,
          onValueChange: onValueChange
        );
      default:
        return Container();
    }
  }
}