import 'package:flutter/material.dart';
import 'package:tugas2mobile/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage(username: username)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            _usernameField(),
            _passwordField(),
            _LoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black12))),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        decoration: InputDecoration(
            suffix: IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
            ),
            hintText: 'Password',
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black12))),
      ),
    );
  }

  Widget _LoginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'admin' && password == 'admin') {
            _navigateToHome();

            setState(() {
              text = 'Login Berhasil';
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              text = 'Login Gagal';
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
            content: Text(text),
            backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text("Login"),
      ),
    );
  }
}
