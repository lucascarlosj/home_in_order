import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class AuthSplashPage extends StatefulWidget {
  const AuthSplashPage({super.key});

  @override
  State<AuthSplashPage> createState() => _AuthSplashPageState();
}

class _AuthSplashPageState extends State<AuthSplashPage> {
  var _animationOpacityLogo = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
      });
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final controller = Injector.of(context).authSplashNotifier;
    return CustomPageBuilder.instance
        .withoutAppBar()
        .addBodyChild(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: AnimatedOpacity(
                duration: Duration(seconds: 2),
                curve: Curves.easeIn,
                opacity: _animationOpacityLogo,
                child: Image.asset(
                  'assets/images/splash_logo.png',
                ),
                onEnd: () {
                  Future.delayed(
                    Duration(seconds: 2),
                    () {
                      context.go('/login');
                    },
                  );
                },
              ),
            ),
          ),
        )
        .build();
  }
}
