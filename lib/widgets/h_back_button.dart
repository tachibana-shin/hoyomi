import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'export.dart';

class HBackButton extends StatelessWidget {
  const HBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final child = IconButton(
      icon: const Iconify(Ion.chevron_left),
      onPressed: () {
        context.pop();
      },
    );
    return Skeleton.keep(child: child);
  }
}
