import 'package:flutter/material.dart';
import 'package:micro_design_system/micro_design_system.dart';

class AuthTokenTitleComponent extends StatelessWidget {
  const AuthTokenTitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder.instance
        .withoutScaffold(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: const CustomTitle(
              title: 'Enviamos um código para o seu telefone',
              subTitle:
                  'Insira o código de 6 dígitos que enviamos para o seu numero de telefone para finalizar seu cadastro',
            ),
          ),
        )
        .build();
  }
}
