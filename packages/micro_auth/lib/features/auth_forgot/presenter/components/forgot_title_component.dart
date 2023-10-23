import 'package:flutter/material.dart';
import 'package:micro_design_system/micro_design_system.dart';

class ForgotTitleComponent extends StatelessWidget {
  const ForgotTitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder.instance
        .withoutScaffold(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: const CustomTitle(
              title: 'Esqueceu sua senha?',
              subTitle: 'Não se preocupe, isso acontece. Insira o e-mail vinculado à sua conta para recupera-lá',
            ),
          ),
        )
        .build();
  }
}
