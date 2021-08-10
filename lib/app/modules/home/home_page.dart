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
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Visita de Enfermagem',
                            style: Theme.of(context).textTheme.subtitle1
                          ),
                          Text(
                            'Hospital São Lucas',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            'OPERADORA: HRPAUDIT',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(height: 10),
                          Text('RAIMUNDO LUIZ BARROS OLIVEIRA'),
                          Row(
                            children: [
                              Text('Idade: 50'),
                              SizedBox(width: 10),
                              Text('Sexo: Masulino'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
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