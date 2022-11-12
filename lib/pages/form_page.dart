import 'package:flutter/material.dart';
import 'package:flutter_app/themes/default_theme.dart';
import '../widgets/widgets.dart' show InputsForm;

class FormPage extends StatefulWidget {
   
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  
  final Map<String, dynamic> valuesForm = {
      'firstname'     : 'Sebastian',
      'lastname'      : 'Gañan',
      'email'         : 'sebag@google.com',
      'dni'           : '123456',
      'estudios'      : '',
      'genero'        : 'masculino',
      'extranjero'    : true
  };
  
  @override
  Widget build(BuildContext context) {
    

    GlobalKey<FormState> keyForm = GlobalKey<FormState>();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page...'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                InputsForm( inputName: 'dni', inputValues: valuesForm, labelText: 'DNI', maxLength: 8, helperText: 'EJ: 22123123',keyboardType: TextInputType.number,suffixIcon: Icons.numbers,),              
                const SizedBox(height: 10,),
                InputsForm( inputName: 'firstname', inputValues: valuesForm, labelText: 'Nombre',),              
                const SizedBox(height: 10,),
                InputsForm( inputName: 'lastname', inputValues: valuesForm, labelText: 'Apellido',),              
                const SizedBox(height: 10,),                
                InputsForm( inputName: 'email', inputValues: valuesForm, labelText: 'Email', helperText: 'EJ: name@dominio.com',keyboardType: TextInputType.emailAddress,suffixIcon: Icons.email,),              
                const SizedBox(height: 10,),   
                DropdownButtonFormField(
                  value: '',
                  borderRadius: BorderRadius.circular(10),
                  items: const [
                    DropdownMenuItem(value: '', child: Text('...'),),
                    DropdownMenuItem(value: 'primario', child: Text('Primario'),),
                    DropdownMenuItem(value: 'secundario', child: Text('Secundario'),),
                    DropdownMenuItem(value: 'terciario', child: Text('Terciario'),),
                    DropdownMenuItem(value: 'universitario', child: Text('Universitario'),),
                  ], 
                  onChanged: (value) {
                    print(value);
                    valuesForm['estudios'] = value;
                  },
                ),
                const SizedBox(height: 25,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text('Femenino'),
                    Radio(
                      activeColor: DefaultTheme.primary,
                      value: 'femenino', 
                      groupValue: valuesForm['genero'], 
                      onChanged: (value) {
                        setState(() {
                          valuesForm['genero'] = value;                          
                        });
                      },
                    ),
                    const Text('Masculino'),
                    Radio(
                      activeColor: DefaultTheme.primary,
                      value: 'masculino', 
                      groupValue: valuesForm['genero'], 
                      onChanged: (value) {
                        setState(() {
                          valuesForm['genero'] = value;                          
                        });
                      },
                    ),
                  ]),
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Extranjero'),
                    Switch(
                        value: valuesForm['extranjero'],                         
                        activeColor: DefaultTheme.primary,
                        onChanged: (value) {
                          setState(() {
                            valuesForm['extranjero'] = value;
                          });
                        },
                    ),
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black54
                      ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('home');
                        }, 
                        child: const SizedBox(
                          width: 100,
                          height: 50,
                          child: Center(
                            child: Text('Cancelar'),
                          ),
                        )
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print(valuesForm);
                          FocusManager.instance.primaryFocus?.unfocus();

                          if(!keyForm.currentState!.validate()){
                            print('Formulario no válido');
                            return;            
                          }
                          print(valuesForm);
                        }, 
                        child: const SizedBox(
                          width: 100,
                          height: 50,
                          child: Center(
                            child: Text('Guardar'),
                          ),
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

