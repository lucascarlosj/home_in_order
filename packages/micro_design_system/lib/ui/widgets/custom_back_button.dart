import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.heightContainer,
    this.widthContainer,
    this.heightIcon,
    this.widthIcon, 
    this.onTap,
  }) : super(key: key);

  final double? heightContainer;
  final double? widthContainer;
  final double? heightIcon;
  final double? widthIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.pop(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 12),
        child: Container(
          height: heightContainer ?? 41,
          width: widthContainer ?? 41,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.greyBorder,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              height: heightIcon ?? 19,
              width: widthIcon ?? 19,
            ),
          ),
        ),
      ),
    );
  }
}
