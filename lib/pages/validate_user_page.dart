import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class ValidateUserPage extends StatelessWidget {
   
  const ValidateUserPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    final authService = Provider.of<AuthFirebaseService>(context, listen: false);

    return Scaffold(     
      backgroundColor: Colors.black,
      body: Center(
         child: FutureBuilder(
                future: authService.readToken(),                
                builder: (BuildContext context, AsyncSnapshot snapshot) {               
                  print('builder...');                  
                  if(snapshot.hasError || (snapshot.hasData && snapshot.data == '')){
                    print('hasError');
                    Future.microtask(() => Navigator.pushReplacementNamed(context, 'login'));
                    return Container();
                  }                  
                  if(snapshot.hasData && snapshot.data != ''){
                    print('hasData');
                    Future.microtask(() => Navigator.pushReplacementNamed(context, 'home'));
                    return Container();
                  }
                  print('CircularProgressIndicator....');
                  return const Center(
                    child:  SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                  );
                },
              ),
      ),
    );
  }
}