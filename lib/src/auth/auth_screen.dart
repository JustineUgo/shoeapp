import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/injection/injection.dart';
import 'package:shoesly/routes/routes.dart';
import 'package:shoesly/routes/routes.gr.dart';
import 'package:shoesly/src/auth/cubit/auth_cubit.dart';
import 'package:shoesly/util/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final cubit = getIt<AuthCubit>();
  final router = getIt<ShoeslyRouter>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? userId = await cubit.load();
      if (userId != null) context.router.replaceAll([const AppRoute()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: FutureBuilder<String?>(
            future: cubit.load(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data == null
                    ? Column(
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
                            onPressed: () => cubit.googleAuth(),
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
                      )
                    : Container();
              }
              return const CircularProgressIndicator();
            }),
      )),
    );
  }
}
