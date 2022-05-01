import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_auth_app2/screens/profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  static Future<User?> loginUsingEmailPassword(
      {required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print('Usuário não encontrado para esse email');
      }
    }
    return user;
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'AUTHENTICATION APP',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Acesse seu aplicativo',
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.mail_outline,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextField(
            textAlign: TextAlign.left,
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Senha',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Esqueceu sua senha?',
              style: TextStyle(color: Colors.red.shade900),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),), primary: Colors.blueAccent),
              onPressed: () async {
                User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                print(user);
                if(user != null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileScreen()));
                }
              },
              child: Text(
                'Entrar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}