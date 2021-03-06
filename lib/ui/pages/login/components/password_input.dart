import 'package:flutter/material.dart';
import '../../../../ui/pages/pages.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<String>(
        stream: presenter.passwordErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
                labelText: 'Senha',
                icon: Icon(Icons.lock),
                errorText:
                    snapshot.data?.isEmpty == true ? null : snapshot.data),
            onChanged: presenter.validatePassword,
            obscureText: true,
          );
        });
  }
}
