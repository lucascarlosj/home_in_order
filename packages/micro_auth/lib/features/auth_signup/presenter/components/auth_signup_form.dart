import 'package:flutter/services.dart';
import 'package:micro_auth/features/auth_signup/domain/entities/user_location.dart';
import 'package:micro_auth/features/auth_signup/presenter/auth_signup_notifier.dart';
import 'package:micro_auth/features/auth_signup/presenter/components/location/location.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

// ignore: must_be_immutable
class AuthSignupForm extends StatefulWidget {
  AuthSignupForm({super.key});

  @override
  State<AuthSignupForm> createState() => _AuthSignupFormState();
}

class _AuthSignupFormState extends State<AuthSignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();
  final _phoneNumber = TextEditingController();
  var _location = UserLocation(address: '', latitude: '', longitude: '');

  Future<void> _checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationPage(),
          ),
        ).then((val) {
          setState(() {
            _location =
                val ?? UserLocation(address: '', latitude: '', longitude: '');
          });
        });
      }
    } else {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationPage(),
        ),
      ).then((val) {
        setState(() {
          _location =
              val ?? UserLocation(address: '', latitude: '', longitude: '');
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Injector.of(context).get<AuthSignupNotifier>();

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
                    height: 16,
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    label: 'Senha',
                    validator: Validatorless.multiple([
                      Validatorless.min(
                          6, 'Senha deve ter pelo menos 6 caracteres'),
                      Validatorless.required('Senha obrigatório'),
                    ]),
                    controller: _passwordEC,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    label: 'Confirmar senha',
                    validator: Validatorless.multiple([
                      Validatorless.compare(_passwordEC,
                          'Senha não coincide com a senha digita acima'),
                      Validatorless.required('Confirma senha obrigatório'),
                    ]),
                    controller: _confirmPasswordEC,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    label: 'Telefone',
                    validator: Validatorless.multiple([
                      Validatorless.required('Telefone obrigatório'),
                    ]),
                    controller: _phoneNumber,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () => _checkPermission(),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: AppColors.greyBorder, width: 2),
                      ),
                      child: Center(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              _location.address.isNotEmpty
                                  ? _location.address
                                  : 'Localização',
                              style: TextStyles.titleMono2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.stepperController.next();
                        controller.sendOtp(
                          _phoneNumber.text.replaceAll(RegExp(r'[^\d]+'), ''),
                        );
                        controller.email = _emailEC.text;
                        controller.password = _passwordEC.text;
                      }
                    },
                    label: 'Continuar',
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
