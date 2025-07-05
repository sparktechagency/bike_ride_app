// import 'package:bike_ride_app/app/utils/app_color.dart';
// import 'package:bike_ride_app/gen/fonts.gen.dart';
// import 'package:bike_ride_app/view/widgets/custom_container.dart';
// import 'package:bike_ride_app/view/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     this.suffixIcon,
//     this.child,
//     this.label,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.height,
//     this.width,
//     this.fontWeight,
//     this.fontSize,
//     this.fontName,
//     required this.onPressed,
//     this.radius,
//     this.prefixIcon,
//     this.bordersColor,
//     this.suffixIconShow = false,
//     this.prefixIconShow = false,
//     this.isLoading = false,
//     this.title,
//     this.iconHeight,
//     this.iconWidth,
//     this.elevation = false,
//   });
//
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final Widget? child;
//   final String? label;
//   final Widget? title;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final double? height;
//   final double? width;
//   final FontWeight? fontWeight;
//   final double? fontSize;
//   final double? radius;
//   final String? fontName;
//   final VoidCallback onPressed;
//   final Color? bordersColor;
//   final bool suffixIconShow;
//   final bool prefixIconShow;
//   final double? iconHeight;
//   final double? iconWidth;
//   final bool isLoading;
//   final bool elevation;
//
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: !isLoading,
//       replacement: const Center(child: CircularProgressIndicator()),
//       child: CustomContainer(
//         elevation: elevation,
//         onTap: onPressed,
//         color: backgroundColor ?? AppColors.primaryColor,
//         height: height ?? 50.h,
//         width: width ?? double.infinity,
//         radiusAll: radius ?? 100.r,
//         bordersColor: bordersColor,
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.black.withOpacity(0.3),
//         //     offset: const Offset(2, 4),
//         //     blurRadius: 6,
//         //   ),
//         // ],
//         boxShadow: elevation
//             ? [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             offset: const Offset(0, 4), // drop shadow at bottom
//             blurRadius: 6,
//           ),
//         ]
//             : null,
//
//         linearColors: [
//           Colors.black.withOpacity(0.25), // top inner shadow
//           AppColors.primaryColor,
//           AppColors.primaryColor,
//           AppColors.primaryColor,
//         ],
//
//         child:
//             child ??
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 /// Prefix Icon
//                 if (prefixIcon != null || prefixIconShow == true) ...[
//                   prefixIcon ?? Icon(Icons.arrow_back),
//                   SizedBox(width: 8.w),
//                 ],
//
//                 if (title != null) title!,
//
//                 /// Label Text
//                 if (label != null)
//                   Flexible(
//                     child: CustomText(
//                       text: label ?? '',
//                       color: foregroundColor ?? Colors.white,
//                       fontName: fontName ?? FontFamily.inter,
//                       fontWeight: fontWeight ?? FontWeight.w400,
//                       fontSize: fontSize ?? 14.sp,
//                     ),
//                   ),
//
//                 /// Suffix Icon
//                 if (suffixIcon != null || suffixIconShow == true) ...[
//                   SizedBox(width: 8.w),
//                   // Use SvgPicture for SVG icons
//                   // suffixIcon != null
//                   //     ? suffixIcon! // If a custom widget is passed as suffixIcon
//                   //     : Assets.icons.arrow.svg(
//                   //         width: iconWidth ?? 8.w,
//                   //         height: iconHeight ?? 8.h,
//                   //         color: foregroundColor ?? AppColors.darkColor,
//                   //       ),
//                 ],
//               ],
//             ),
//       ),
//     );
//   }
// }
