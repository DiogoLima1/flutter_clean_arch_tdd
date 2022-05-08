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
          child: Column(
        children: [
          Container(
            child: ListTile(leading: Icon(Icons.dehaze), title: Text('Login')),
          ),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    icon: Icon(Icons.lock),
                  ),
                ),
                RaisedButton(onPressed: () {}, child: Text('Entrar')),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                    label: Text('Criar Conta'))
              ],
            ),
          )
        ],
      )),
    );
  }
}
