import 'package:facebook/screens/home_page.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b5ecd),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset(
              'images/icon.webp',
              height: 200,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'Weather',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
              ),
            ),
            Text(
              'Forecasts',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                fixedSize: Size(250, 60),
                primary: Color(0xff239fdb),
              ),
            ),
            Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
