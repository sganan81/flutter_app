import 'package:flutter/material.dart';
import 'package:flutter_app/providers/theme_provider.dart';
import 'package:flutter_app/shared/preferences.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
   
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar:AppBar(
         centerTitle:true,
         title: const Text('ProfilePage'),
         elevation:10,
      ),
      body: SingleChildScrollView(
        child: Column(
           children: [
            HeaderProfile(size: size),          
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: BodyProfile(),
            ),
           ],
        ),
      ),
    );
  }
}

class BodyProfile extends StatelessWidget {
  const BodyProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<ThemeProvider>(context, listen: true);  

    return Column(
            children: [
              TextFormField(
                onChanged: (value) {                  
                  Preferences.email = value;
                },
                initialValue: Preferences.email,
                style: const TextStyle(
                  color: Colors.black,
                ),                       
                keyboardType: TextInputType.emailAddress,
                decoration: decorationInputs(icon:Icons.email, helperText: 'Ej:name@dominio.com'),
              ),
              const SizedBox(height: 10,),
              TextFormField(     
                onChanged: (value) {                  
                  Preferences.nombre = value;
                },
                initialValue: Preferences.nombre,
                keyboardType: TextInputType.text,
                decoration: decorationInputs(label: 'Nickname'),
              ),
              const SizedBox(height: 15,),   
              SwitchListTile.adaptive(
                title: const Text('Dark Mode'),
                value: Preferences.darkmode, 
                onChanged: (value) {
                  Preferences.darkmode = value;
                  (value) ? temaActual.setDark():  temaActual.setLight();
                },
              )    
            ],
          );
  }

  InputDecoration decorationInputs({IconData? icon, String? hintText, String? helperText, String? label}) {
    return InputDecoration(         
          fillColor: Colors.black,
          label: Text(label ?? ''),
          hintText: hintText,      
          helperStyle: const TextStyle(
            color: Colors.black
          ),      
          helperText: helperText,                          
          prefixIcon: (icon != null) ? Icon(icon):null,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1, 
              color: Color(0xff2d3e4f)
            )
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3, 
              color: Color(0xff2d3e4f)
            )
          ),
          enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2, 
              color: Color(0xff2d3e4f)
            )
          ),
        );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      color: const Color(0xff2d3e4f),
      child: Center(
        child: CircleAvatar(
          radius: 100,
          child: Image.network('https://cdn2.iconfinder.com/data/icons/flat-style-svg-icons-part-1/512/user_man_male_profile_account-512.png'),
        ),
      ),
    );
  }
}


