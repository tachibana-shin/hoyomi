import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HorizontalList<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? more;
  final Widget Function(BuildContext, T, int) builder;
  final List<T>? items;
  final Widget? child;

  final bool needSubtitle;

  const HorizontalList({
    super.key,
    required this.title,
    this.subtitle,
    required this.more,
    this.items,
    this.child,
    required this.builder,
    required this.needSubtitle,
  }) : assert(items != null || child != null);

  static Widget buildContainer(
    BuildContext context, {
    required String title,
    required String? subtitle,
    required String? more,
    required bool needSubtitle,
    required Widget Function(double viewFraction) builder,
  }) {
    final header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
          ],
        ),
        if (more != null)
          ElevatedButton(
            onPressed: () => context.push(more),
            child: Text('More'),
          )
        else
          SizedBox.shrink(),
      ],
    );
    final main = LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.biggest.width;
        double crossAxisCount;

        if (screenWidth <= 600) {
          crossAxisCount = 3.5;
        } else if (screenWidth <= 900) {
          crossAxisCount = 4.5;
        } else {
          crossAxisCount = 6.5;
        }

        final childAspectRatio = 2 / 3;
        final viewportFraction = 1 / crossAxisCount;
        final height =
            1 / childAspectRatio * (screenWidth * viewportFraction - 8.0) +
            14.0 * 2 +
            18.0 +
            (needSubtitle ? 12.0 * 2 : 12.0 / 2);

        return SizedBox(height: height, child: builder(viewportFraction));
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header, main],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildContainer(
      context,
      title: title,
      subtitle: subtitle,
      more: more,
      needSubtitle: needSubtitle,
      builder:
          (viewportFraction) =>
              child ??
              PageView.builder(
                itemCount: items!.length,
                allowImplicitScrolling: true,
                padEnds: false,
                controller: PageController(
                  viewportFraction: viewportFraction,
                  initialPage: 0,
                ),
                itemBuilder: (context, index) {
                  return builder(context, items!.elementAt(index), index);
                },
              ),
    );
  }
}
