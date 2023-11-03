//import 'package:micro_auth/features/auth_token/presenter/auth_token_notifier.dart';
//import 'package:micro_core/config/dependency_injection.dart';
import 'package:micro_auth/features/auth_signup/presenter/auth_signup_notifier.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class AuthTokenFormComponent extends StatelessWidget {
  AuthTokenFormComponent({super.key});

  final tokenEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Injector.of(context).get<AuthSignupNotifier>();
    return CustomPageBuilder.instance
        .withoutScaffold(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                Pinput(
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[350]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  length: 6,
                  controller: tokenEC,
                ),
                SizedBox(height: 30),
                CustomElevatedButton(
                  label: 'Registrar-se',
                  onPressed: () {
                    // controller.validateOtp(tokenEC.text);
                  },
                ),
              ],
            ),
          ),
        )
        .build();
  }
}
