import 'package:flutter/material.dart';
import 'package:micro_auth/features/auth_signup/presenter/auth_signup_notifier.dart';
import 'package:micro_auth/features/auth_signup/presenter/steps/auth_signup_token_step.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_design_system/micro_design_system.dart';
import 'package:micro_design_system/ui/widgets/custom_stepper/step.dart';

import 'steps/auth_signup_form_step.dart';

class AuthSignupPage extends StatelessWidget {
  const AuthSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Injector.of(context).get<AuthSignupNotifier>();

    return CustomPageBuilder.instance
        .withoutScaffold(
          child: CustomStepper(
            controller: controller.stepperController,
            children: _steps,
            title: '',
          ),
        )
        .build();
  }

  List<CustomStep> get _steps => [
        CustomStep(
          child: AuthSignupFormStep(),
          hasAppBar: false,
        ),
        CustomStep(
          child: AuthSignupTokenStep(),
          hasAppBar: false,
        ),
      ];
}
