import 'package:flutter/material.dart';
import '../../../../ui/pages/pages.dart';
import 'package:provider/provider.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<String>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
                errorText:
                    snapshot.data?.isEmpty == true ? null : snapshot.data),
            onChanged: presenter.validateEmail,
            keyboardType: TextInputType.emailAddress,
          );
        });
  }
}
