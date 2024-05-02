import 'package:flutter/material.dart';
import 'package:inventory/user/userHome.dart';

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

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showAdminLogin() {
    setState(() {
      _isLoginAdminSelected = true;
    });
  }

  void _loginAsAdmin() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    // Implement your authentication logic here
    print('Admin logged in with username: $username and password: $password');
    // Navigate to admin page
  }

  void _loginAsUser() {
    // Assuming successful login logic here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
    //print('User logged in and navigated to scanner');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
      ),
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
        ElevatedButton(
          onPressed: _showAdminLogin,
          style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
          child: Text('Login as Admin'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _loginAsUser,
          style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
          child: Text('Login as User'),
        ),
      ],
    );
  }

  Widget _buildAdminLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300, // Adjust width to make the box smaller or larger
          child: TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 300, // Adjust width to make the box smaller or larger
          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility,
                ),
                onPressed: () {
                  // Toggle password visibility
                },
              ),
            ),
            obscureText: true,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _loginAsAdmin,
          style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
          child: Text('Submit'),
        ),
        SizedBox(height: 20),
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
