import 'package:flutter/material.dart';
import 'package:micro_design_system/micro_design_system.dart';

class LoginHeader extends StatefulWidget {
  const LoginHeader({super.key});

  @override
  State<LoginHeader> createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> {
  late Image headerEmail;

  initState() {
    super.initState();
    headerEmail = Image.asset('assets/images/image_background.jpg');
  }

  @override
  void didChangeDependencies() {
    precacheImage(headerEmail.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder.instance
        .withoutScaffold(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: headerEmail.image,
              ),
            ),
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(1),
                  ],
                ),
              ),
            ),
          ),
        )
        .build();
  }
}
