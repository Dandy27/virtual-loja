import 'package:flutter/material.dart';
import 'package:virtualloja_app/helpers/validators.dart';
import 'package:provider/provider.dart';
import 'package:virtualloja_app/models/user.dart';
import 'package:virtualloja_app/models/user_manager.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/signup');
              },
              textColor: Colors.white,
              child: Text(
                'CRIAR CONTA',
                style: TextStyle(fontSize: 14),
              ))
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userMAnager, __) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: emailController,
                      enabled: !userMAnager.loading,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if (!emailValid(email)) return 'E-mail válido';
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passController,
                      enabled: !userMAnager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      autocorrect: false,
                      obscureText: true,
                      validator: (pass) {
                        if (pass.isEmpty || pass.length < 6)
                          return 'Senha Inválida';
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        child: const Text('Esqueci minha senha'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        onPressed: userMAnager.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  userMAnager.signIn(
                                      user: User(
                                          email: emailController.text,
                                          password: passController.text),
                                      onFail: (e) {
                                        scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content: Text('Falha ao entrar: $e'),
                                          backgroundColor: Colors.red,
                                        ));
                                      },
                                      onSuccess: () {
                                        // TODO FECHAR A TELA DE LOGIN
                                      });
                                }
                              },
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                            Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        child: userMAnager.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Text(
                                'Entrar',
                                style: TextStyle(fontSize: 18),
                              ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
