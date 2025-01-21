import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VerticalList<T> extends StatelessWidget {
  final String title;
  final String? more;
  final bool noHeader;
  final ScrollController? controller;
  final Widget Function(BuildContext, T, int) builder;
  final List<T> Function() getDataLoading;
  final Widget? Function(Object? error) builderError;
  final List<T>? items;
  final Future<List<T>>? itemsFuture;

  VerticalList(
      {super.key,
      required this.title,
      required this.more,
      this.noHeader = false,
      required this.controller,
      required this.items,
      required this.itemsFuture,
      required this.builder,
      required this.getDataLoading,
      required this.builderError}) {
    if (itemsFuture == null && items == null) {
      throw ArgumentError('Either itemsFuture or items must be provided.');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (noHeader == true) {
      return _buildGridView(context, items!);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (noHeader != true)
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    )),
            if (more != null)
              ElevatedButton(
                  onPressed: () {
                    context.push(more!);
                  },
                  child: Text('More'))
            else
              SizedBox.shrink()
          ]),
        if (noHeader != true) const SizedBox(height: 8.0),
        if (itemsFuture != null)
          FutureBuilder(
            future: itemsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Skeletonizer(
                    enabled: true,
                    child: _buildGridView(context, getDataLoading()));
              }
              if (snapshot.hasError) {
                return builderError(snapshot.error) ??
                    Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData ||
                  (snapshot.data is List
                      ? (snapshot.data as List).isEmpty
                      : false)) {
                return const Center(child: Text('No data available'));
              }

              return _buildGridView(context, snapshot.data!);
            },
          )
        else
          _buildGridView(context, items!)
      ],
    );
  }

  Widget _buildGridView(BuildContext context, List<T> items) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth <= 600) {
      crossAxisCount = 3;
    } else if (screenWidth <= 900) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 6;
    }

    return DynamicHeightGridView(
      shrinkWrap: true,
      // padding: const EdgeInsets.all(8.0),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 10.0,
      //   childAspectRatio: 1/3,
      // ),
      itemCount: items.length,
      controller: controller,
      builder: (context, index) {
        return builder(context, items.elementAt(index), index);
      },
    );
  }
}
