import 'package:flutter/material.dart';
import 'package:inventory/user/userHome.dart';
import 'package:inventory/admin/adminHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: const ButtonThemeData(buttonColor: Colors.blueAccent),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          button: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white70,
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginAdminSelected = false;
  bool _passwordVisible = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showAdminLogin() {
    setState(() {
      _isLoginAdminSelected = true;
    });
  }

  void _loginAsAdmin() {
    // Hardcoded credentials for proof of concept
    const String hardcodedUsername = "admin";
    const String hardcodedPassword = "password";

    // Get the input from the text fields
    final String inputUsername = _usernameController.text;
    final String inputPassword = _passwordController.text;

    // Check if the input matches the hardcoded credentials
    if (inputUsername == hardcodedUsername &&
        inputPassword == hardcodedPassword) {
      // Credentials match, navigate to the admin home page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => adminHome()),
      );
    } else {
      // Credentials do not match, show an error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Login Failed"),
            content: const Text("Incorrect username or password."),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(), // Close the dialog
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  void _loginAsUser() {
    // Assuming successful login logic here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => userHome()),
    );
    //print('User logged in and navigated to scanner');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _isLoginAdminSelected ? _buildAdminLogin() : _buildInitialButtons(),
      ),
    );
  }

  Widget _buildInitialButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/logo.png', width: 180), // Logo added here
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: _showAdminLogin,
          style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
          child: const Text('Login as Admin'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _loginAsUser,
          style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
          child: const Text('Login as User'),
        ),
      ],
    );
  }

  Widget _buildAdminLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300,
          child: TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 300,
          child: TextField(
            controller: _passwordController,
            obscureText: !_passwordVisible, // Toggles the password visibility
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible =
                        !_passwordVisible; // Toggle the state between true and false
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _loginAsAdmin,
          style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
          child: Text('Submit'),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            setState(() {
              _isLoginAdminSelected = false;
            });
          },
          child: Text('Back'),
        ),
      ],
    );
  }
}
