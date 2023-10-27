import 'package:flutter/material.dart';
import 'package:micro_auth/features/auth_signup/presenter/auth_signup_notifier.dart';
import 'package:micro_auth/features/auth_signup/presenter/components/auth_token_bottom_component.dart';
import 'package:micro_auth/features/auth_signup/presenter/components/auth_token_form_component.dart';
import 'package:micro_auth/features/auth_signup/presenter/components/auth_token_title_component.dart';
import 'package:micro_core/config/dependency_injection.dart';
import 'package:micro_design_system/resources/builders/custom_page_builder.dart';
import 'package:micro_design_system/ui/widgets/custom_back_button.dart';

class AuthSignupTokenStep extends StatelessWidget {
  const AuthSignupTokenStep({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Injector.of(context).get<AuthSignupNotifier>();
    return CustomPageBuilder.instance
        .withoutAppBar()
        .addBodyChild(
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButton(
                        onTap: () => controller.stepperController.back(),
                      ),
                      AuthTokenTitleComponent(),
                      AuthTokenFormComponent(),
                      const Spacer(),
                      AuthTokenBottomComponent()
                      //context.replaceNamed(name)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        .build();
  }
}
