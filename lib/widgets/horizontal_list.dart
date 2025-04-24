import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HorizontalList<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? more;
  final Widget Function(BuildContext, T, int) builder;
  final List<T>? items;
  final Widget? child;

  final int titleLength;
  final bool itemSubtitle;
  final bool itemTimeAgo;

  const HorizontalList({
    super.key,
    required this.title,
    this.subtitle,
    required this.more,
    this.items,
    this.child,
    required this.builder,
    required this.titleLength,
    required this.itemSubtitle,
    required this.itemTimeAgo,
  }) : assert(items != null || child != null);

  static Widget buildContainer(
    BuildContext context, {
    required String title,
    required String? subtitle,
    required String? more,
    required int titleLength,
    required bool itemSubtitle,
    required bool itemTimeAgo,
    required Widget Function(double viewFraction) builder,
  }) {
    final header = ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          // fontSize: 18.0,
          // fontWeight: FontWeight.w600,
          // color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle:
          subtitle != null
              ? Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              )
              : null,
      trailing:
          more != null
              ? ElevatedButton(
                onPressed: () => context.push(more),
                child: Text('More'),
              )
              : null,
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

        final viewportFraction = 1 / crossAxisCount;

        final widthItem =
            (screenWidth / crossAxisCount) - 4.0 * 2 /* space by Card */;
        final defaultLineHeight = 1.42;
        final heightItem =
            (widthItem) / (2 / 3) /* image */ +
            4.0 * 2 /* space by Card */ +
            /// === title ===
            2.0 * 2 /* padding */ +
            14.0 *
                (widthItem < 14.0 * titleLength ? 2 : 1) *
                defaultLineHeight /* font */ +
            /// === /title ===
            ///
            /// === subtitle ===
            (itemSubtitle ? 12.0 * defaultLineHeight : 0) /* font */ +
            /// === /subtitle ===
            ///
            /// === time ago ===
            (itemTimeAgo ? 12.0 * defaultLineHeight : 0) + /* font */
            /// === /time ago ===
            1.0
        /// offset
        ;

        return SizedBox(height: heightItem, child: builder(viewportFraction));
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
      titleLength: titleLength,
      itemSubtitle: itemSubtitle,
      itemTimeAgo: itemTimeAgo,
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
