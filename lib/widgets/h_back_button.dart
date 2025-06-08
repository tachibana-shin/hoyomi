import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HBackButton extends StatelessWidget {
  const HBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton.ignore(
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
