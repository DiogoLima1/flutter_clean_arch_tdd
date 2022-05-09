import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_tdd/ui/pages/login/components/components.dart';
import 'package:provider/provider.dart';
import '../../../ui/components/components.dart';
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
              showErrorMessage(context, error);
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
                Provider(
                  create: (_) => widget.presenter,
                  child: Form(
                    child: Column(
                      children: [
                        EmailInput(),
                        PasswordInput(),
                        LoginButton(),
                        FlatButton.icon(
                            onPressed: null,
                            icon: Icon(Icons.person),
                            label: Text('Criar Conta'))
                      ],
                    ),
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
