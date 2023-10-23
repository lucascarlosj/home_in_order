import 'package:flutter/material.dart';
import 'package:micro_auth/features/auth_signup/presenter/components/auth_signup_bottom.dart';
import 'package:micro_design_system/micro_design_system.dart';

import 'components/auth_signup_form.dart';
import 'components/auth_signup_header.dart';

class AuthSignupPage extends StatelessWidget {
  const AuthSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      const CustomBackButton(),
                      const AuthSignupHeader(),
                      AuthSignupForm(),
                      const Spacer(),
                      AuthSignupBottom()
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
