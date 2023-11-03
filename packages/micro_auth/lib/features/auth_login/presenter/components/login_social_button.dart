import 'package:flutter/material.dart';
import 'package:micro_auth/micro_auth.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_design_system/micro_design_system.dart';
import 'package:micro_design_system/ui/widgets/custom_social_buttons.dart';

class LoginSocialButton extends StatelessWidget {
  const LoginSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Injector.of(context).get<AuthLoginNotifier>();
    return CustomPageBuilder.instance
        .withoutScaffold(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                CustomSocialButton(
                  onPressed: () => controller.loginWithGoogle(),
                  iconPath: 'assets/icons/google.svg',
                  label: 'Login com o Google',
                ),
                SizedBox(
                  height: 36,
                )
              ],
            ),
          ),
        )
        .build();
  }
}
