import 'package:flutter/material.dart';
import 'package:lesson_8moonz4/view/homepage.dart';
import 'package:lesson_8moonz4/view/signup.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 90, left: 70),
                  child: Image.asset(
                    "assets/icons/Rocket (right side view).png",
                    width: 250,
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.only(top: 250, left: 230),
                    child: Image.asset("assets/icons/True 2 1.png", width: 100),
                  ),
                ),
              ],
            ),
            Text(
              "KELAJAK KASBI “TRADINGNI”",
              style: TextStyle(color: Colors.white),
            ),

            Text(
              "BIZ BILAN MUKAMMAL O’RGANING",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Text(
                  "Tradingni o’rganmoqchi bo’lsangiz",
                  style: TextStyle(color: Colors.blueGrey),
                ),

                Text(
                  "ushbu ilova orqali ro’yxatdan o’ting va",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Text(
                  "Professional Trader bo’ling!",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
            SizedBox(height: 100),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rotish()),
                  );
                },
                child: Text(
                  "RO’YXATDAN O’TISH",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login, color: Colors.blueGrey),
                  Text("Kirish", style: TextStyle(color: Colors.blueGrey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
