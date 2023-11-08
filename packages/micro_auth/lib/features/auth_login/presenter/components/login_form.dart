import 'package:micro_auth/features/auth_login/presenter/auth_login_notifier.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Injector.of(context).get<AuthLoginNotifier>();
    return CustomPageBuilder.instance
        .withoutScaffold(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    label: 'E-mail',
                    validator: Validatorless.multiple([
                      Validatorless.email('Digite um e-mail valido!'),
                      Validatorless.required('E-mail obrigatório'),
                    ]),
                    controller: _emailEC,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    label: 'Senha',
                    obscureText: true,
                    validator: Validatorless.required('Senha obrigatória!'),
                    controller: _passwordEC,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => context.push('/forgot'),
                      child: Text(
                        'Esqueceu sua senha? ',
                        style: TextStyles.linkPrimaryColor14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.loginWithEmail(
                          _emailEC.text,
                          _passwordEC.text,
                        );
                      }
                    },
                    label: 'Entrar',
                  ),
                  SizedBox(
                    height: 27,
                  ),
                ],
              ),
            ),
          ),
        )
        .build();
  }
}
