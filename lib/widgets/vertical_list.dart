import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// kinawa de Suki ni Natta Ko ga Hougen
class VerticalList<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? more;
  final ScrollController? controller;
  final Widget Function(BuildContext, T, int) builder;
  final List<T>? items;
  final Widget? child;
  final bool disableScroll;

  const VerticalList({
    super.key,
    required this.title,
    this.subtitle,
    required this.more,
    this.controller,
    this.items,
    this.child,
    this.disableScroll = false,
    required this.builder,
  }) : assert(items != null || child != null);

  static int getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth <= 600) {
      crossAxisCount = 3;
    } else if (screenWidth <= 900) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 6;
    }

    return crossAxisCount;
  }

  @override
  Widget build(BuildContext context) {
    if (title == '') {
      return _buildGridView(context, items!);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            if (more != null)
              ElevatedButton(
                onPressed: () {
                  context.push(more!);
                },
                child: Text('More'),
              )
            else
              SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 8.0),
        _buildGridView(context, items!),
      ],
    );
  }

  Widget _buildGridView(BuildContext context, List<T> items) {
    return DynamicHeightGridView(
      shrinkWrap: true,
      // padding: const EdgeInsets.all(8.0),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: getCrossAxisCount(context),
      controller: controller,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 10.0,
      physics: disableScroll ? const NeverScrollableScrollPhysics() : null,
      //   childAspectRatio: 1/3,
      // ),
      itemCount: items.length,
      builder: (context, index) {
        return builder(context, items.elementAt(index), index);
      },
    );
  }
}
