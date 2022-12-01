import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/themes/themes.dart';
import 'package:flutter_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {
   
  const LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      backgroundColor: Colors.black,
      body: BackgroundLogin(
        icon: Icons.verified_user_outlined,
        child: SingleChildScrollView(
          child: Column(            
            children: [
              const SizedBox( height: 250 ),
              CardAuth(
                child: Column(
                  children: [
                    const SizedBox( height: 10 ),
                    Text('Login', style: Theme.of(context).textTheme.headline4 ),
                    const SizedBox( height: 30 ),    
                    ChangeNotifierProvider(
                      create: ( BuildContext context ) => LoginFormProvider(),
                      child: _LoginForm()
                    )               
                  ],
                )
              ),
              const SizedBox( height: 50 ),
              TextButton(
                  child: const Text('Registrarse', 
                              style: TextStyle( 
                                    fontSize: 18, 
                                    fontWeight: FontWeight.bold, 
                                    color:Colors.white 
                                  ),
                              ),
                  onPressed: () => Navigator.of(context).pushReplacementNamed('register'),
              ),
              const SizedBox( height: 50 ),
            ],
          )
        )
      ),      
    );
  }
}


class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return SizedBox(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: loginForm.formKey,
        child: Column(
          children: [
            
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'name@domain.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: ( value ) => loginForm.email = value,
              validator: ( value ) {

                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Correo inválido';

              },
            ),

            const SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: (value) {
                
              },
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'Mínimo 6 caracteres';                                    
                  
              },
            ),

            const SizedBox( height: 30 ),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: const Color(0xff014a9e) ,              
              onPressed: loginForm.isLoading ? null : () async {
                
                FocusScope.of(context).unfocus();
                                
                if( !loginForm.isValidForm() ) return;

                loginForm.isLoading = true;

                Navigator.pushReplacementNamed(context, 'home');
                // TODO: alerta error si credenciales son incorrectas              
                loginForm.isLoading = false;                
              },
              child: Container(
                padding: const EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading 
                    ? 'Espere'
                    : 'Ingresar',
                  style: const TextStyle( color: Colors.white ),
                )
              ),
            )

          ],
        ),
      ),
    );
  }
}
