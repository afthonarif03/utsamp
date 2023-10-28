import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Gantilah 'dashboard_screen.dart' dengan file dashboard yang sebenarnya

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color.fromARGB(255, 143, 13, 218), Color.fromARGB(255, 225, 42, 212)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(
              height: 50,
            ),
            _inputField("Username", usernameController),
            const SizedBox(
              height: 20,
            ),
            _inputField("Password", passwordController, isPassword: true),
            const SizedBox(
              height: 50,
            ),
            _loginBtn(context), // Mengirimkan context sebagai parameter
            const SizedBox(
              height: 20,
            ),
            _extraText(),
          ],
        ),
      ),
    );
  }

 Widget _icon() {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.person, color: Colors.white, size: 120),
      ),
      const SizedBox(height: 8), // Jarak antara ikon dan teks
      const Text(
        "LOGIN",
        style: TextStyle(color: Colors.white, fontSize: 20),
        
      ),
    ],
  );
}

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn(BuildContext context) {
    // Menerima parameter context
    return ElevatedButton(
      onPressed: () {
        // Tambahkan perintah untuk pindah ke halaman Dashboard
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DashboardScreen()), // Gantilah 'DashboardScreen()' dengan nama halaman dashboard yang sebenarnya
        );
      },
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _extraText() {
    return const Text(
      "AFTHON ARIF (21670038)",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}
