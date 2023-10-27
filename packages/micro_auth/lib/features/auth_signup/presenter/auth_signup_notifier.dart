import 'dart:developer';
import 'dart:io';

import 'package:micro_auth/features/auth_signup/domain/exceptions/auth_signup_service_exception.dart';
import 'package:micro_auth/features/auth_signup/domain/usecase/auth_signup.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class AuthSignupNotifier extends ChangeNotifier {
  final _signupService = Injector.instance.get<AuthSignup>();

  final CustomStepperController stepperController = CustomStepperController();

  final ValueNotifier<String> _email = ValueNotifier('');
  final ValueNotifier<String> _password = ValueNotifier('');

  String phone = '';
  final _toast = CustomToast();
  final _navigation = RouterRegister.getIntance();

  String get email => _email.value;

  set email(String value) {
    _email.value = value;
  }

  String get password => _password.value;

  set password(String value) {
    _password.value = value;
  }

  Future<void> register(String email, String password) async {
    final result = await _signupService.register(email, password);

    switch (result) {
      case Success():
        return;
      case Failure(
          exception: AuthSignUpServiceException(message: final message)
        ):
        throw message;
    }
  }

  TwilioPhoneVerify _twilioPhoneVerify = TwilioPhoneVerify(
    accountSid: 'AC59b0f16f2f8b4910fe88767cdf74da6b',
    serviceSid: 'VAbeb9a2acda5bc568766b57ca0e0a2392',
    authToken: '4400183244b7745b491e15e6978dcdae',
  );

  void sendOtp(String phoneNumber) async {
    var twilioResponse =
        await _twilioPhoneVerify.sendSmsCode('+55$phoneNumber');
    phone = phoneNumber;
    if (twilioResponse.statusCode == HttpStatus.ok) {
      log('Codigo enviado ${twilioResponse.verification}');
    } else {
      log(twilioResponse.errorMessage.toString());
    }
  }

  void validateOtp(String token) {
    _twilioPhoneVerify
        .verifySmsCode(phone: '+55$phone', code: token)
        .then((value) {
      if (value.statusCode == HttpStatus.ok) {
        _navigation.router.go('/login');
        register(email, password);
        _toast.successToast('Conta criada com sucesso!');
      } else {
        _toast.successToast('Conta criada com sucesso!');
      }
    });
  }
}
