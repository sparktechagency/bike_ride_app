/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/authLogo.svg
  SvgGenImage get authLogo => const SvgGenImage('assets/icons/authLogo.svg');

  /// File path: assets/icons/calenderIcon.svg
  SvgGenImage get calenderIcon =>
      const SvgGenImage('assets/icons/calenderIcon.svg');

  /// File path: assets/icons/coinIcon.svg
  SvgGenImage get coinIcon => const SvgGenImage('assets/icons/coinIcon.svg');

  /// File path: assets/icons/endIcon.svg
  SvgGenImage get endIcon => const SvgGenImage('assets/icons/endIcon.svg');

  /// File path: assets/icons/groupIcon.svg
  SvgGenImage get groupIcon => const SvgGenImage('assets/icons/groupIcon.svg');

  /// File path: assets/icons/homeIcon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/icons/homeIcon.svg');

  /// File path: assets/icons/onBoardingIcon1.svg
  SvgGenImage get onBoardingIcon1 =>
      const SvgGenImage('assets/icons/onBoardingIcon1.svg');

  /// File path: assets/icons/onBoardingIcon2.svg
  SvgGenImage get onBoardingIcon2 =>
      const SvgGenImage('assets/icons/onBoardingIcon2.svg');

  /// File path: assets/icons/onBoardingIcon3.svg
  SvgGenImage get onBoardingIcon3 =>
      const SvgGenImage('assets/icons/onBoardingIcon3.svg');

  /// File path: assets/icons/pitStopIcon.svg
  SvgGenImage get pitStopIcon =>
      const SvgGenImage('assets/icons/pitStopIcon.svg');

  /// File path: assets/icons/rideSchedule.svg
  SvgGenImage get rideSchedule =>
      const SvgGenImage('assets/icons/rideSchedule.svg');

  /// File path: assets/icons/ridesIcon.svg
  SvgGenImage get ridesIcon => const SvgGenImage('assets/icons/ridesIcon.svg');

  /// File path: assets/icons/splashIcon.svg
  SvgGenImage get splashIcon =>
      const SvgGenImage('assets/icons/splashIcon.svg');

  /// File path: assets/icons/startIcon.svg
  SvgGenImage get startIcon => const SvgGenImage('assets/icons/startIcon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    authLogo,
    calenderIcon,
    coinIcon,
    endIcon,
    groupIcon,
    homeIcon,
    onBoardingIcon1,
    onBoardingIcon2,
    onBoardingIcon3,
    pitStopIcon,
    rideSchedule,
    ridesIcon,
    splashIcon,
    startIcon,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/confirmImage.svg
  SvgGenImage get confirmImage =>
      const SvgGenImage('assets/images/confirmImage.svg');

  /// File path: assets/images/creditsCard.svg
  SvgGenImage get creditsCard =>
      const SvgGenImage('assets/images/creditsCard.svg');

  /// List of all assets
  List<SvgGenImage> get values => [confirmImage, creditsCard];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
