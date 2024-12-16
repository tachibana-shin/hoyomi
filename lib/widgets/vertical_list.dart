import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerticalList<T> extends StatelessWidget {
  final String title;
  final String? more;
  final bool noHeader;
  final Widget Function(BuildContext, T, int) builder;
  final Widget? Function(Object? error) builderError;
  final Iterable<T>? items;
  final Future<Iterable<T>>? itemsFuture;

  VerticalList(
      {super.key,
      required this.title,
      required this.more,
      this.noHeader = false,
      required this.items,
      required this.itemsFuture,
      required this.builder,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            if (more != null)
              ElevatedButton(
                  onPressed: () {
                    context.push(more!);
                  },
                  child: Text('More'))
          ]),
        if (noHeader != true) const SizedBox(height: 8.0),
        if (itemsFuture != null)
          FutureBuilder(
            future: itemsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return builderError(snapshot.error) ??
                    Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData ||
                  (snapshot.data is Iterable
                      ? (snapshot.data as Iterable).isEmpty
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

  Widget _buildGridView(BuildContext context, Iterable<T> items) {
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
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 10.0,
      //   childAspectRatio: 1/3,
      // ),
      itemCount: items.length,
      builder: (context, index) {
        return builder(context, items.elementAt(index), index);
      },
    );
  }
}
