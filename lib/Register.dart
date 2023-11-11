/*import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  //const Login({required Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController ?_emailController;
  TextEditingController ?_passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
  _emailController?.dispose();
  _passwordController?.dispose();
   super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLoginForm(),
    );
  }


Widget buildLoginForm() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.blue],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/undraw_Thought_process_re_om58-removebg-preview.png",
                  width: 190,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Welcome",
               style: TextStyle(
                  fontSize: 35.0,
                  fontFamily:"Bold",
                  color: Colors.black,
           )
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer votre email.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mot de passe'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer votre mot de passe.';
              }
              return null;
            },
            
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: (){
              if(_formKey.currentState!.validate()){
                               Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height:50,
              width: 20,
              decoration:  BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                ),
              child:const Center(
                child: Text("Connexion",
                      style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                )
                ),
            ),
          ),
          ),
        ],
      ),
        )
      ],
    ),
  );
}
}*/

import 'dart:convert';

import 'package:dashboard_flutter/signin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

Future<void> register(String name, String email, String password) async {
  final response = await http.post(
    Uri.parse("https://mesprojetapp.000webhostapp.com/DASHBORD/register.php"),
    body: {
      "nom": name,
      "email": email,
      "password": password,
    },
  );
  
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data);
  }
}
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _NameController;
  TextEditingController? _ConfirpassController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _NameController = TextEditingController();

  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLoginForm(),
    );
  }

  Widget buildLoginForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.blue],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/undraw_Thought_process_re_om58-removebg-preview.png",
                      width: 190,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 35.0,
                  fontFamily: "Bold",
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: _NameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre Nom.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer votre Email.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ' mot de passe',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez saisir votre mot de passe.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                   TextFormField(
                    controller: _ConfirpassController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ' confirmer votre mot de passe',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez confirmer votre mot de passe.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                       if(_ConfirpassController?.value.text == _ConfirpassController?.value.text){
                           register(_NameController!.value.text, _emailController!.value.text, _passwordController!.value.text);
                       }
                       else{
                        print("les mots de passes sont differnets");
                       }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      height: 50,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Inscription",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                   Padding(
                    padding: const EdgeInsets.all(12),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                        const Text("Avez vous un Compte?"),
                        TextButton(
                          onPressed:(){
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                          }, 
                          child: const Text("Log in",
                          style: TextStyle(
                            color: Colors.blue
                          ),),
                          )
                       ],
                                     ),
                   )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


