import 'dart:developer';
import 'dart:io';

import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class AuthTokenNotifier extends ChangeNotifier {
  String phone = '';
  final _toast = CustomToast();
  final _navigation = RouterRegister.getIntance();

  TwilioPhoneVerify _twilioPhoneVerify = TwilioPhoneVerify(
    accountSid: 'AC59b0f16f2f8b4910fe88767cdf74da6b',
    serviceSid: 'VAbeb9a2acda5bc568766b57ca0e0a2392',
    authToken: '2449c2cf6cad9b7b6cf68d15344b5249',
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
        _toast.successToast('Conta criada com sucesso!');
      } else {
        _toast.successToast('Conta criada com sucesso!');
      }
    });
  }
}
