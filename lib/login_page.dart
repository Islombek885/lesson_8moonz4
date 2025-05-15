import 'package:flutter/material.dart';
import 'package:lesson_8moonz4/chatspage.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool emailError = false;
  bool passwordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bosh sahifa"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Center(
            child: Text(
              'Kirish',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 8),
                Text('E-Email:'),
              ],
            ),
            SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'namuna@gmail.com',
                border: OutlineInputBorder(),
                errorText:
                    emailError ? 'Iltimos, emailni to‘g‘ri kiriting' : null,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [Icon(Icons.lock), SizedBox(width: 8), Text('Parol:')],
            ),
            SizedBox(height: 12),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                errorText: passwordError ? 'Parolni kiriting' : null,
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextButton(onPressed: () {
               Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
            }, child: Text('Parolni unutdingizmi?')),
            SizedBox(height: 20),
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      emailError =
                          emailController.text.isEmpty ||
                          !RegExp(
                            r'\S+@\S+\.\S+',
                          ).hasMatch(emailController.text);
                      passwordError = passwordController.text.isEmpty;
                    });

                    if (!emailError && !passwordError) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chatspage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size(double.infinity, 50),
                  ),
                  child: Text('Kirish', style: TextStyle(color: Colors.white)),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(color: Colors.grey, height: 20, thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'yoki',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Divider(color: Colors.grey, height: 20, thickness: 1),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9wQ03pOmwiR1DmHeHv9Dw0HOdxtz3bkhzUQ&s',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ), 
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3s1WuvjTsUVkTax9mVE42FMD2ajUFVs2JxQ&s',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Continue with Facebook',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
