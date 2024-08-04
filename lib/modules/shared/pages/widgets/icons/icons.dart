// ignore_for_file: deprecated_member_use

import 'package:corelab_challenge/modules/shared/pages/styles/colors.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/icons/icons_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  final AppIconData icon;
  final Color? color;
  final double size;
  const AppIcon(this.icon, {super.key, this.color, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon.toString(),
      color: color ?? AppColors.primary,
      // The correct approach would be to use SvgTheme... IF IT WORKED PROPERLY, AT LEAST.
      // theme: SvgTheme(currentColor: color ?? AppColors.primary), (DOESN'T WORK AS WELL)
      height: size,
      width: size,
    );
  }
}
