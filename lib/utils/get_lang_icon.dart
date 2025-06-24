import 'package:flutter/material.dart';
import 'package:hoyomi/constraints/skill_icons.dart';
import 'package:hoyomi/widgets/export.dart';

Widget? getLangIcon(BuildContext context, String? lang, {double size = 16}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  switch (lang?.toLowerCase()) {
    case 'dart':
      return Iconify(
        isDark ? SkillIcons.dartLight : SkillIcons.dartDark,
        size: size,
        iconColor: true,
      );
    case 'ts':
    case 'typescript':
      return Iconify(SkillIcons.typescript, size: size, iconColor: true);
    case 'js':
    case 'javascript':
      return Iconify(SkillIcons.javascript, size: size, iconColor: true);
    case 'lua':
      return Iconify(
        isDark ? SkillIcons.luaLight : SkillIcons.luaDark,
        size: size,
        iconColor: true,
      );
    default:
      return null;
  }
}
