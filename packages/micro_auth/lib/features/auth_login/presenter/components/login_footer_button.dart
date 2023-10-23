import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class LoginFooterButton extends StatelessWidget {
  const LoginFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder.instance
        .withoutScaffold(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Ainda não possui uma conta? '),
                    InkWell(
                      key: Key('SignupButton'),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => context.push('/signup'),
                      child: Text(
                        'Registre-se agora.',
                        style: TextStyles.linkPrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        )
        .build();
  }
}
