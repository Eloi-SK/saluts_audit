import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../modules/auth/auth_store.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  final authStore = Modular.get<AuthStore>();

  @override
  void initState() {
    super.initState();

    store.fetchForms();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    reaction<bool>((_) => authStore.isLogged, whenIsLoggedChanged);
  }

  void whenIsLoggedChanged(bool isLogged) {
    if (!isLogged) {
      Modular.to.pushReplacementNamed('/login');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salutis'),
        actions: [
          IconButton(
            onPressed: dialog,
            icon: Icon(EvaIcons.logOut)
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 6),
            child: buildToggleButtons(),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                return store.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () => store.fetchForms(refresh: true),
                      child: store.forms.isEmpty
                        ? buildEmptyState()
                        : buildList()
                    );
              }
            )
          )
        ],
      )
    );
  }

  Widget buildEmptyState() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            EvaIcons.inboxOutline,
            size: MediaQuery.of(context).size.width / 4,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(height: 30),
          Center(child: Text('Não visitas a fazer')),
          TextButton(
            onPressed: () => Modular.to.pushNamed('forms/1'),
            child: Text('Formulário')
          )
        ],
      ),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: store.forms.length,
      itemBuilder: (context, index) {
        final form = store.forms[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: InkWell(
            onTap: () => Modular.to.pushNamed('forms/${form.id}'),
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
          ),
        );
      }
    );
  }

  Widget buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(
          builder: (_) {
            return ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Pendentes'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Iniciados'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('FInalizados'),
                ),
              ],
              isSelected: store.selections,
              onPressed: store.selectStatus,
            );
          }
        )
      ]
    );
  }

  void dialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Salutis'),
          content: Text('Deseja realmente sair?'),
          actions: [
            TextButton(
              onPressed: authStore.logout,
              child: Text('SIM')
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('NÃO')
            ),
          ],
        );
      }
    );
  }
}