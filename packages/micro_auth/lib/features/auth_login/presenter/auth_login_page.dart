import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

import 'components/login_divider.dart';
import 'components/login_footer_button.dart';
import 'components/login_form.dart';
import 'components/login_header.dart';
import 'components/login_social_button.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({Key? key}) : super(key: key);

  @override
  _AuthLoginPageState createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage>
    with TickerProviderStateMixin {
  final _messagingService = MessagingService();
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _messagingService.init(context);
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder.instance
        .withoutAppBar()
        .addBodyChild(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      _buildAnimatedItem(LoginHeader(), 0),
                      _buildAnimatedItem(LoginForm(), 1),
                      _buildAnimatedItem(LoginDivider(label: 'ou'), 2),
                      _buildAnimatedItem(LoginSocialButton(), 3),
                      const Spacer(),
                      _buildAnimatedItem(LoginFooterButton(), 4)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
        .build();
  }

  Widget _buildAnimatedItem(Widget child, int delay) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          delay * 0.2,
          (delay + 1) * 0.2,
          curve: Curves.easeIn,
        ),
      )),
      child: child,
    );
  }
}
