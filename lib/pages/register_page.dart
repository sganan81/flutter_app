import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/themes/themes.dart';
import 'package:flutter_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class RegisterPage extends StatelessWidget {
   
  const RegisterPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      backgroundColor: Colors.black,
      body: BackgroundLogin(
        icon: Icons.keyboard_alt_outlined,
        child: SingleChildScrollView(
          child: Column(            
            children: [
              const SizedBox( height: 250 ),
              CardAuth(
                child: Column(
                  children: [
                    const SizedBox( height: 10 ),
                    Text('Registro', style: Theme.of(context).textTheme.headline4 ),
                    const SizedBox( height: 30 ),    
                    ChangeNotifierProvider(
                      create: ( BuildContext context ) => LoginFormProvider(),
                      child: _RegisterForm()
                    )               
                  ],
                )
              ),
              const SizedBox( height: 50 ),
              TextButton(
                  child: const Text('¿Ya tenes una cuenta?', 
                              style: TextStyle( 
                                    fontSize: 18, 
                                    fontWeight: FontWeight.bold, 
                                    color:Colors.white 
                                  ),
                              ),
                  onPressed: () => Navigator.of(context).pushReplacementNamed('login'),
              ),
              const SizedBox( height: 50 ),
            ],
          )
        )
      ),      
    );
  }
}


class _RegisterForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<LoginFormProvider>(context);

    return SizedBox(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: registerForm.formKey,
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
              onChanged: ( value ) => registerForm.email = value,
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
              onPressed: registerForm.isLoading ? null : () async {
                
                FocusScope.of(context).unfocus();
                                
                if( !registerForm.isValidForm() ) return;

                registerForm.isLoading = true;

                Navigator.pushReplacementNamed(context, 'home');
                // TODO: alerta error si credenciales son incorrectas              
                registerForm.isLoading = false;                
              },
              child: Container(
                padding: const EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text(
                  registerForm.isLoading 
                    ? 'Espere'
                    : 'Registrarme',
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

