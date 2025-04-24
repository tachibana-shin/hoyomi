import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Iconify extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const Iconify(this.icon, {super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);

    final bool applyTextScaling = iconTheme.applyTextScaling ?? false;
    final double tentativeIconSize = size ?? iconTheme.size ?? kDefaultFontSize;
    final double iconSize =
        applyTextScaling
            ? MediaQuery.textScalerOf(context).scale(tentativeIconSize)
            : tentativeIconSize;

    final double iconOpacity = iconTheme.opacity ?? 1.0;
    Color? iconColor = color ?? iconTheme.color!;
    if (iconOpacity != 1.0) {
      iconColor = iconColor.withAlpha((iconColor.a * iconOpacity).round());
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
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        width: iconSize,
        height: iconSize,
        alignment: Alignment.center,
        matchTextDirection: true,
        excludeFromSemantics: true,
      ),
    );
  }
}
