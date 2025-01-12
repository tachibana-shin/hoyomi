import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HorizontalList<T> extends StatelessWidget {
  final String title;
  final String? more;
  final bool noHeader;
  final Widget Function(BuildContext, T, int) builder;
  final Widget? Function(Object? error) builderError;
  final List<T>? items;
  final Future<List<T>>? itemsFuture;
  final Future<int>? totalFuture;

  const HorizontalList(
      {super.key,
      required this.title,
      required this.more,
      this.noHeader = false,
      required this.items,
      required this.itemsFuture,
      required this.builder,
      required this.builderError,
      required this.totalFuture})
      : assert(items == null || itemsFuture == null);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double crossAxisCount;

    if (screenWidth <= 600) {
      crossAxisCount = 3.5;
    } else if (screenWidth <= 900) {
      crossAxisCount = 4.5;
    } else {
      crossAxisCount = 6.5;
    }

    final childAspectRatio = 2 / 4.1;
    final viewportFraction = 1 / crossAxisCount;
    final height = 1 /
        childAspectRatio *
        (MediaQuery.of(context).size.width) *
        viewportFraction;

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
            if (totalFuture != null)
              FutureBuilder(
                  future: totalFuture!,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(children: [
                        SizedBox(height: 2),
                        Text(
                          "${snapshot.data} results",
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ]);
                    }

                    return Stack(children: []);
                  })
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
        if (items != null)
          SizedBox(
            height: height,
            child: PageView.builder(
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
        else
          FutureBuilder(
            future: itemsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                    height: height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ));
              }
              if (snapshot.hasError) {
                return builderError(snapshot.error) ??
                    SizedBox(
                        height: height,
                        child: Center(
                          child: Text('Error: ${snapshot.error}'),
                        ));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SizedBox(
                    height: height,
                    child: Center(
                      child: Text('No data available.'),
                    ));
              }

              final items = snapshot.data!;
              return SizedBox(
                height: height,
                child: PageView.builder(
                  itemCount: items.length,
                  allowImplicitScrolling: true,
                  padEnds: false,
                  controller: PageController(
                    viewportFraction: viewportFraction,
                    initialPage: 0,
                  ),
                  itemBuilder: (context, index) {
                    return builder(context, items.elementAt(index), index);
                  },
                ),
              );
            },
          ),
      ],
    );
  }
}
