import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class ForgotFormComponent extends StatelessWidget {
  ForgotFormComponent({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder.instance
        .withoutScaffold(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    label: 'E-mail',
                    validator: Validatorless.multiple([
                      Validatorless.email('Digite um e-mail valido!'),
                      Validatorless.required('E-mail obrigatório'),
                    ]),
                    controller: _emailEC,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // controller.forgotPassword(_emailEC.text);
                        // Get.back();
                      }
                    },
                    label: 'Enviar e-mail',
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
