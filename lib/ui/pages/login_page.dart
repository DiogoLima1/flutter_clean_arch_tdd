import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      icon: Icon(Icons.lock),
                    ),
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
