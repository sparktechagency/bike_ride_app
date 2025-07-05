import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/app/utils/app_constant.dart';
import 'package:bike_ride_app/gen/fonts.gen.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscure;
  final Color? filColor;
  final Color? borderColor;
  final Color? hintextColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final int? maxLine;
  final double? hintextSize;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final bool? isEmail;
  final bool? readOnly;
  final double? borderRadio;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;

  const CustomTextField({
    super.key,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.hintText,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLine,
    this.validator,
    this.hintextColor,
    this.borderColor,
    this.isEmail,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscure = '*',
    this.filColor,
    this.hintextSize,
    this.labelText,
    this.isPassword = false,
    this.readOnly = false,
    this.borderRadio,
    this.onTap,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          CustomText(
            text: widget.labelText ?? '',
            fontName: FontFamily.montserrat,
            color: AppColors.secondaryColor,
            bottom: 4.h,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        SizedBox(
          height: 4.h,
        ),
        TextFormField(
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          readOnly: widget.readOnly ?? false,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscuringCharacter: widget.obscure ?? '*',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: widget.maxLine ?? 1,
          textInputAction: widget.textInputAction,
          validator: widget.validator ??
                  (value) {
                final val = value?.trim() ?? '';
                final hint = widget.hintText?.toLowerCase() ?? '';

                if (widget.isEmail == true) {
                  if (val.isEmpty) {
                    return "Please enter $hint";
                  } else if (!AppConstants.emailValidate.hasMatch(val)) {
                    return "Please enter a valid email";
                  }
                } else if (widget.isPassword) {
                  if (val.isEmpty) {
                    return "Please enter $hint";
                  } else if (AppConstants.validatePassword(val)) {
                    return "Insecure password detected";
                  }
                } else {
                  if (val.isEmpty) {
                    return "Please enter $hint";
                  }
                }
                return null;
              },
          cursorColor: Colors.black,
          obscureText: widget.isPassword ? obscureText : false,
          style: TextStyle(
            color: widget.hintextColor ?? Colors.black,
            fontSize: widget.hintextSize ?? 14.h,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.contentPaddingHorizontal ?? 20.w,
              vertical: widget.contentPaddingVertical ?? 10.h,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: widget.prefixIcon,
            ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
              onTap: toggle,
              child: _suffixIcon(
                obscureText
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
            )
                : widget.suffixIcon,
            prefixIconConstraints: BoxConstraints(minHeight: 24.w, minWidth: 24.w),
            // labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: widget.hintextColor ?? AppColors.grey400,
              fontSize: widget.hintextSize ?? 14.h,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.montserrat,
            ),
            focusedBorder: _focusedBorder(),
            enabledBorder: _enabledBorder(),
            errorBorder: _errorBorder(),
            border: _focusedBorder(),
            errorStyle: TextStyle(fontSize: 12.h, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  /// ✅ Updated this to accept `Widget` instead of `SvgPicture`
  Widget _suffixIcon(Widget icon) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: icon,
    );
  }

  OutlineInputBorder _focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadio?.r ?? 16.r),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.primaryColor.withOpacity(.5),
      ),
    );
  }

  OutlineInputBorder _enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadio?.r ?? 16.r),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.primaryColor.withOpacity(.5),
      ),
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadio?.r ?? 16.r),
      borderSide: const BorderSide(color: Colors.red, width: 0.5),
    );
  }
}
