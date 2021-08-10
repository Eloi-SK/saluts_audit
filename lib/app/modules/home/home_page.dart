import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  @override
  void initState() {
    super.initState();

    store.fetchForms();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salutis'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildToggleButtons(),
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: store.forms.length,
                  itemBuilder: (context, index) {
                    final form = store.forms[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                form.nome,
                                style: Theme.of(context).textTheme.subtitle1
                              ),
                              Text(
                                form.hospital,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                'OPERADORA: ${form.operadora}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              SizedBox(height: 10),
                              Text(form.beneficiario),
                              Row(
                                children: [
                                  Text('Idade: ${form.idade}'),
                                  SizedBox(width: 10),
                                  Text('Sexo: ${form.sexo}'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              }
            )
          )
        ],
      )
    );
  }

  Widget buildToggleButtons() {
    return Container(
      height: 60,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Observer(
            builder: (_) {
              return ToggleButtons(
                constraints: BoxConstraints(minWidth: (MediaQuery.of(context).size.width * 0.92) / 3),
                children: [
                  Text('Pendentes'),
                  Text('Iniciados'),
                  Text('FInalizados'),
                ],
                isSelected: store.selections,
                onPressed: store.select,
              );
            }
          );
        },
      ),
    );
  }
}