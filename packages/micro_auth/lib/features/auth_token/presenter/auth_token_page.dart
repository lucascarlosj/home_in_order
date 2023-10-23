import 'package:flutter/material.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/resources/builders/custom_page_builder.dart';
import 'package:micro_design_system/ui/widgets/custom_back_button.dart';

import 'components/auth_token_bottom_component.dart';
import 'components/auth_token_form_component.dart';
import 'components/auth_token_title_component.dart';

class AuthTokenPage extends StatelessWidget {
  const AuthTokenPage({super.key});

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
