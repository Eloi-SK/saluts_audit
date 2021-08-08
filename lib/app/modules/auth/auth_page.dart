import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

import '../../utils/utils.dart';
import 'auth_store.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}
class AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    reaction<bool>((_) => store.isLoading, whenIsLoadingChanged);
    reaction<bool>((_) => store.isLogged, whenIsLoggedChanged);
    reaction<String>((_) => store.mainError!, whenMainChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            buildHeader(),
            SizedBox(height: 24),
            buildUsernameInput(),
            SizedBox(height: 8),
            buildPasswordInput(),
            SizedBox(height: 24),
            buildLoginButton()
          ],
        ),
      )
    );
  }

  Row buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Feito com ',
          style: GoogleFonts.bebasNeue(
            fontSize: 30
          ),
        ),
        Icon(
          EvaIcons.heart,
          color: Theme.of(context).primaryColor,
          size: 60,
        ),
      ],
    );
  }

  void whenIsLoadingChanged(bool isLoading) {
    if (isLoading) {
      showLoading(context);
    } else {
      hideLoading(context);
    }
  }

  void whenIsLoggedChanged(bool isLogged) {
    if (isLogged) {
      Modular.to.pushReplacementNamed('../');
    }
  }

  void whenMainChanged(String? error) {
    if (error != null) {
      showMessage(context, error, SnackMessageType.error);
    }
  }

  Widget buildUsernameInput() {
    return Observer(
      builder: (_) {
        return TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Usuário',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
            errorText: store.usernameError
          ),
          onChanged: store.validateUsername,
        );
      }
    );
  }

  Widget buildPasswordInput() {
    return Observer(
      builder: (_) {
        return TextField(
          autofocus: false,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Senha',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
            errorText: store.passwordError
          ),
          onChanged: store.validatePassword,
        );
      }
    );
  }

  Widget buildLoginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Observer(
        builder: (_) {
          return ElevatedButton(
            onPressed: store.isFormValid ? store.login : null,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )
            ),
            child: Text('ENTRAR')
          );
        }
      )
    );
  }
}