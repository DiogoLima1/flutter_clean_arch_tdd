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
                  StreamBuilder<String>(
                      stream: presenter.emailErrorStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              icon: Icon(Icons.email),
                              errorText: snapshot.data?.isEmpty == true
                                  ? null
                                  : snapshot.data),
                          onChanged: presenter.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                        );
                      }),
                  StreamBuilder<String>(
                      stream: presenter.passwordErrorStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Senha',
                              icon: Icon(Icons.lock),
                              errorText: snapshot.data?.isEmpty == true
                                  ? null
                                  : snapshot.data),
                          onChanged: presenter.validatePassword,
                          obscureText: true,
                        );
                      }),
                  StreamBuilder<bool>(
                      stream: presenter.isFormValidStream,
                      builder: (context, snapshot) {
                        return RaisedButton(
                          onPressed:
                              snapshot.data == true ? presenter.auth : null,
                          child: Text('Entrar'.toUpperCase()),
                        );
                      }),
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
