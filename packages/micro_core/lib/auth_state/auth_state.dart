import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class AuthState {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _navigator = RouterRegister.getIntance();

  void checkAuthState() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        _navigator.router.go('/login');
      } else {
        _navigator.router.go('/home-provider');
        //checkedUser();
      }
    });
  }

  Future<void> checkedUser() async {
    final user = _firebaseAuth.currentUser;

    if (user == null) return;

    final docData = (await _firebaseFirestore.collection('users').doc(user.uid).get()).data()!;

    switch (docData['user_type']) {
      case 'provider':
        return _handleProvider(docData['complete_register_data'],
            docData['complete_register_photo']);
      case 'contractor':
        return _handleContractor(docData['complete_registration_data']);
    }
  }

  void _handleProvider(
    bool? completeRegistrationData,
    bool? completeRegistrationPhoto,
  ) {
    if (completeRegistrationPhoto != true) {
      if (completeRegistrationData == null || completeRegistrationData == false) {
        _navigator.router.go('/register-provider-form');
      } else if (completeRegistrationPhoto == null || completeRegistrationPhoto == false) {
        _navigator.router.go('/register-provider-photo');
      }
    } else {
      _navigator.router.go('/home-provider');
    }
  }

  void _handleContractor(
    bool? completeRegistrationData,
  ) {
    if (completeRegistrationData != true && (completeRegistrationData == null || completeRegistrationData == false)) {
        _navigator.router.go('/register-contractor-form');
    } else {
        _navigator.router.go('/home-contract');
    }
  }
}
