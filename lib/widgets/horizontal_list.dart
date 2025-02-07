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

  const HorizontalList(
      {super.key,
      required this.title,
      this.subtitle,
      required this.more,
      this.items,
      this.child,
      required this.builder,
      required this.needSubtitle})
      : assert(items != null || child != null);

  Widget _buildContainer(BuildContext context,
      {required Widget Function(double viewFraction) builder}) {
    double screenWidth = MediaQuery.of(context).size.width;
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
    final height = 1 /
            childAspectRatio *
            MediaQuery.of(context).size.width *
            viewportFraction +
        14.0 * 2 +
        (needSubtitle ? 12.0 * 2 : 12.0 / 2);

    return SizedBox(height: height, child: builder(viewportFraction));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                subtitle!,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
          ]),
          if (more != null)
            ElevatedButton(
                onPressed: () {
                  context.push(more!);
                },
                child: Text('More'))
          else
            SizedBox.shrink()
        ]),
        _buildContainer(
          context,
          builder: (viewportFraction) =>
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
        )
      ],
    );
  }
}
