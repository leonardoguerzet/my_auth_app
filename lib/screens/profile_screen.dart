import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text('Seu Aplicativo', style: TextStyle(color: Colors.white), ),
              ),
      body: Center(child: Text('Login efetuado com sucesso!'),),

    );
  }
}
