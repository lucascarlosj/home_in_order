// ignore_for_file: must_be_immutable

import 'package:flutter/services.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.value,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.textInputAction,
    this.expands = false,
    this.enabled = true,
    this.autofocus = false,
    this.onTap,
    this.readOnly = false,
    Key? key,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        assert(
          obscureText == true ? suffixIcon == null : true,
          'ObscureText não pode ser adicionado junto com o suffixIcon',
        ),
        super(key: key);

  final String? label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final ValueNotifier<bool> _obscureTextVN;
  String? value;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  int? maxLength;
  int? minLines;
  int? maxLines;
  bool expands;
  bool autofocus;
  bool enabled;
  TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          onTap: onTap,
          autofocus: autofocus,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          enabled: enabled,
          onChanged: onChanged,
          controller: controller,
          initialValue: value,
          validator: validator,
          maxLength: maxLength,
          obscureText: obscureTextValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF7F8F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColors.greyBorder, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColors.greyBorder, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColors.greyBorder, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColors.greyBorder, width: 2),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      _obscureTextVN.value = !obscureTextValue;
                    },
                    icon: SvgPicture.asset(
                      obscureTextValue
                          ? 'assets/icons/eye.svg'
                          : 'assets/icons/eye_slash.svg',
                      height: 25,
                      colorFilter: ColorFilter.mode(
                        AppColors.greyDark.withOpacity(0.5),
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : suffixIcon,
            hintText: label,
            hintStyle: enabled == false
                ? TextStyle(
                    color: Colors.grey[400],
                  )
                : TextStyles.titleMono2,
          ),
        );
      },
    );
  }
}
