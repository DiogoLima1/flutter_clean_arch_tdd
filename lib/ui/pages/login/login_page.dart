import 'package:flutter/material.dart';
import '../../pages/pages.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(''),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Container(
              child:
                  ListTile(leading: Icon(Icons.dehaze), title: Text('Login')),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                    ),
                    onChanged: presenter.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      icon: Icon(Icons.lock),
                    ),
                    onChanged: presenter.validatePassword,
                    obscureText: true,
                  ),
                  RaisedButton(onPressed: null, child: Text('Entrar')),
                  FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.person),
                      label: Text('Criar Conta'))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
