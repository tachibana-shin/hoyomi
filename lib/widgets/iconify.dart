import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Iconify extends StatelessWidget {
  final String icon;
  final bool iconColor;
  final Color? color;
  final double? size;

  const Iconify(
    this.icon, {
    super.key,
    this.iconColor = false,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);

    final bool applyTextScaling = iconTheme.applyTextScaling ?? false;
    final double tentativeIconSize = size ?? iconTheme.size ?? kDefaultFontSize;
    final double iconSize = applyTextScaling
        ? MediaQuery.textScalerOf(context).scale(tentativeIconSize)
        : tentativeIconSize;

    final double iconOpacity = iconTheme.opacity ?? 1.0;
    Color? colorIcon = color ?? iconTheme.color!;
    if (iconOpacity != 1.0) {
      colorIcon = colorIcon.withAlpha((colorIcon.a * iconOpacity).round());
    }

    return Skeleton.replace(
      replacement: Container(
        width: iconSize,
        height: iconSize,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          shape: BoxShape.circle,
        ),
      ),
      child: SvgPicture.string(
        icon,
        colorFilter: iconColor
            ? null
            : ColorFilter.mode(colorIcon, BlendMode.srcIn),
        width: iconSize,
        height: iconSize,
        alignment: Alignment.center,
        matchTextDirection: true,
        excludeFromSemantics: true,
      ),
    );
  }
}
