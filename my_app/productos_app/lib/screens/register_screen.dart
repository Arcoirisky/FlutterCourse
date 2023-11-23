import 'package:flutter/material.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:productos_app/providers/login_form_provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (_) => LoginFormPorvider(),
                      // Sólo lo q esta dentro de este child va a tener acceso al provider
                    ),
                  ],
                  child: const _LoginForm(),
                ),
              ),
              const SizedBox(height: 50),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.indigo[10]),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                ),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'login'),
                child: const Text(
                  '¿Tienes una cuenta?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormPorvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'Register',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 10),
          const _EmailInput(),
          const SizedBox(height: 10),
          const _PasswordInput(),
          const SizedBox(height: 30),
          const _LoginButton(),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormPorvider>(context);

    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Colors.deepPurple,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text(
          loginForm.isLoading ? 'Espere' : 'Registrarse',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onPressed: loginForm.isLoading
          ? null
          : () async {
              FocusManager.instance.primaryFocus?.unfocus();
              final AuthService authService =
                  Provider.of<AuthService>(context, listen: false);

              if (!loginForm.isValidForm()) return;
              loginForm.isLoading = true;

              final String? errorMessage = await authService.createUser(
                  loginForm.email, loginForm.password);

              if (errorMessage == null) {
                // Mostrar error
                Navigator.pushReplacementNamed(context, 'home');
              } else {
                // TODO: Mostrar error en pantalla
                print(errorMessage);
                NotificationsService.showSnackbarError(errorMessage);
                loginForm.isLoading = false;
              }
              // Validar si el registro es correcto
            },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormPorvider>(context);

    return TextFormField(
      readOnly: loginForm.isLoading,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.length >= 6) return null;
        return 'La contraseña debe de ser de 6 caracteres';
      },
      onChanged: (value) => loginForm.password = value,
      autocorrect: false,
      obscureText: true,
      decoration: InputDecorations.authInputDecoration(
        icon: Icons.lock_outline,
        labelText: 'Contraseña',
        hintText: '*****',
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormPorvider>(context);

    return TextFormField(
      readOnly: loginForm.isLoading,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) => loginForm.email = value,
      validator: (value) {
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(pattern);
        return regExp.hasMatch(value ?? '')
            ? null
            : 'El valor ingresado no luce como un correo';
      },
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.authInputDecoration(
          icon: Icons.alternate_email,
          labelText: 'Correo electrónico',
          hintText: 'john.doe@gmail.com'),
    );
  }
}
