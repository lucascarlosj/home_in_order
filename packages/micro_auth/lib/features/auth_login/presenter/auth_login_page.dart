import 'package:micro_auth/features/auth_login/presenter/components/login_header.dart';
import 'package:micro_auth/features/auth_login/presenter/components/login_divider.dart';
import 'package:micro_auth/features/auth_login/presenter/components/login_footer_button.dart';
import 'package:micro_auth/features/auth_login/presenter/components/login_form.dart';
import 'package:micro_auth/features/auth_login/presenter/components/login_social_button.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  final _messagingService = MessagingService();

  @override
  void initState() {
    super.initState();
    _messagingService.init(context);
  }

  @override
  Widget build(BuildContext context) {
    //final controller = Injector.of(context).authLoginNotifier;

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
                      LoginHeader(),
                      LoginForm(),
                      LoginDivider(label: 'ou'),
                      LoginSocialButton(),
                      const Spacer(),
                      LoginFooterButton()
                    ],
                  ),
                ),
              )
            ],
          ),
        )
        .build();
  }
}
