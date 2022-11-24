import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_proyecto_final/providers/auth_provider.dart';
import 'package:web_proyecto_final/providers/login_form_provider.dart';
import 'package:web_proyecto_final/ui/imputs/custom_imputs.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final loginFormProvider = Provider.of<LoginFormProvider>(context);

          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'Email no válido';
                            }
                            return null;
                          },
                          onChanged: (value) => loginFormProvider.email = value,
                          decoration: CustomImputs.loginImputDecoration(
                            hint: 'Ingrese su email',
                            label: 'Email',
                            icon: Icons.email_outlined,
                          )),
                      const SizedBox(height: 20),
                      TextFormField(
                        onFieldSubmitted: (_) =>
                            onFormSubmit(loginFormProvider, authProvider),
                        onChanged: (value) =>
                            loginFormProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          if (value.length < 6) {
                            return 'La contraseña debe de ser de 6 caracteres';
                          }

                          return null; // Válido
                        },
                        decoration: CustomImputs.loginImputDecoration(
                          hint: 'Ingrese su contraseña',
                          label: 'Contraseña',
                          icon: Icons.lock_outlined,
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text('Ingresar'),
                        ),
                        onPressed: () {
                          onFormSubmit(loginFormProvider, authProvider);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
