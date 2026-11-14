import 'package:flutter/material.dart';
import 'package:flutter_application_2/socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String errorMessage;
  late bool isError;

  @override
  void initState(){
    errorMessage = 'This is an error message';
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void checkLogin(username, password) {
    setState((){
    if (username =="") {
      errorMessage = 'Username cannot be empty';
      isError = true; 
    } else if (password == "") {
      errorMessage = 'Password cannot be empty';
      isError = true; 
    } else {
      errorMessage = '';
      isError = false;
    }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo3.jpg', width: 48, height: 48),
                  const SizedBox(width: 10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Text('Friendr', style: txtstyle),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              TextField(
                controller: usernameController, 
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Username',
                  prefixIcon: Icon(Icons.person),
                  ),
                  ),
              const SizedBox(height: 15), 

              TextField(
                controller: passwordController, 
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                  prefixIcon: Icon(Icons.lock),),
                  ),
              const SizedBox(height: 15), 

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  checkLogin(usernameController.text, passwordController.text);
                  if (!isError) {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => Socialmedia()),
                    );
                  }
                },

                child: Text('Login', style: txtstyle2),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

var txtstyle = const TextStyle(
  fontSize: 14,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
);

var registertxtstyle = const TextStyle(
  fontSize: 14,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
);

var errorStyle = const TextStyle(
  fontSize: 14,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
  color: Colors.red,
);

var txtstyle2 = const TextStyle(
  fontSize: 14,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

