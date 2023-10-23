import 'package:flutter/material.dart';
import 'package:micro_design_system/micro_design_system.dart';

import 'components/forgot_bottom_component.dart';
import 'components/forgot_form_component.dart';
import 'components/forgot_title_component.dart';

class AuthForgotPage extends StatelessWidget {
  const AuthForgotPage({super.key});

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
                      ForgotTitleComponent(),
                      ForgotFormComponent(),
                      const Spacer(),
                      ForgotBottomComponent()
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
