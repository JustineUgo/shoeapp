import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/util/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(ShoeslyImages.icon, height: 60, width: 60),
            ),
            const SizedBox(height: 150),
            const Text('Step into style. Discover your perfect pair today.', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.google),
                  SizedBox(width: 20),
                  Text('Continue with Google', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text('or'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Continue as Guest', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      )),
    );
  }
}
