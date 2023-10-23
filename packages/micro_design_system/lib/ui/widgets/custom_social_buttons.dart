import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton(
      {Key? key,
      required this.onPressed,
      required this.iconPath,
      required this.label})
      : super(key: key);
  final VoidCallback onPressed;
  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 72,
        width: MediaQuery.sizeOf(context).width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.greyBorder, width: 2),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                height: 26,
                width: 26,
              ),
              SizedBox(
                width: 10,
              ),
              Text(label)
            ],
          ),
        ),
      ),
    );
  }
}