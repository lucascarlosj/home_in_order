import 'package:flutter/material.dart';
import 'package:micro_design_system/micro_design_system.dart';

class AuthSignupHeader extends StatelessWidget {
  const AuthSignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder.instance
        .withoutScaffold(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: const CustomTitle(
              title: 'Registre-se para começar',
              subTitle:
                  'Que bom que você esta conosco, para começar basta apenas fazer seu cadastro abaixo.',
            ),
          ),
        )
        .build();
  }
}
