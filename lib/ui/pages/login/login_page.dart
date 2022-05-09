import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_tdd/ui/components/components.dart';
import '../../pages/pages.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(''),
      ),
      body: Builder(
        builder: (context) {
          widget.presenter.isLoadingStream.listen((isLoading) {
            if (isLoading) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });

          widget.presenter.mainErrorStream.listen((error) {
            if (error != null) {
              Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(error, textAlign: TextAlign.center),
              ));
            }
          });

          return SingleChildScrollView(
              child: Center(
            child: Column(
              children: [
                Container(
                  child: ListTile(
                      leading: Icon(Icons.dehaze), title: Text('Login')),
                ),
                Form(
                  child: Column(
                    children: [
                      StreamBuilder<String>(
                          stream: widget.presenter.emailErrorStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  icon: Icon(Icons.email),
                                  errorText: snapshot.data?.isEmpty == true
                                      ? null
                                      : snapshot.data),
                              onChanged: widget.presenter.validateEmail,
                              keyboardType: TextInputType.emailAddress,
                            );
                          }),
                      StreamBuilder<String>(
                          stream: widget.presenter.passwordErrorStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Senha',
                                  icon: Icon(Icons.lock),
                                  errorText: snapshot.data?.isEmpty == true
                                      ? null
                                      : snapshot.data),
                              onChanged: widget.presenter.validatePassword,
                              obscureText: true,
                            );
                          }),
                      StreamBuilder<bool>(
                          stream: widget.presenter.isFormValidStream,
                          builder: (context, snapshot) {
                            return RaisedButton(
                              onPressed: snapshot.data == true
                                  ? widget.presenter.auth
                                  : null,
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
          ));
        },
      ),
    );
  }
}
