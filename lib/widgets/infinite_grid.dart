import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class InfiniteGrid<T> extends StatefulWidget {
  final List<T> data;
  final bool hasReachedMax;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final Future<({bool isLastPage, List<T> data})> Function() fetchData;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  const InfiniteGrid({
    super.key,
    required this.data,
    required this.hasReachedMax,
    required this.crossAxisCount,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start,
    required this.fetchData,
    required this.itemBuilder,
  });

  @override
  State<InfiniteGrid> createState() => _InfiniteGridState<T>();
}

class _InfiniteGridState<T> extends State<InfiniteGrid<T>> {
  late List<T> _data;

  Object? _error;
  bool _isLoading = false;
  bool _hasReachedMax = false;
  bool _firstSetup = true;

  @override
  void initState() {
    super.initState();

    _data = widget.data;
    _hasReachedMax = widget.hasReachedMax;
  }

  int columnLength(int itemCount) {
    if (itemCount % widget.crossAxisCount == 0) {
      return itemCount ~/ widget.crossAxisCount;
    } else {
      return (itemCount ~/ widget.crossAxisCount) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InfiniteList(
      itemCount: columnLength(_data.length),
      isLoading: _isLoading,
      hasError: _error != null,
      hasReachedMax: _hasReachedMax,
      centerLoading: true,
      centerError: true,
      onFetchData: () async {
        if (_hasReachedMax) return;
        if (_firstSetup) {
          _firstSetup = false;
          return;
        }
        _isLoading = true;
        setState(() {});

        try {
          final (isLastPage: isLastPage, data: items) =
              await widget.fetchData();

          _data.addAll(items);
          _hasReachedMax = isLastPage;
        } catch (err) {
          _error = err;
        } finally {
          _isLoading = false;
          setState(() {});
        }
      },
      itemBuilder:
          (context, index) => _GridRow(
            columnIndex: index,
            builder:
                (context, index) =>
                    widget.itemBuilder(context, _data.elementAt(index), index),
            itemCount: _data.length,
            crossAxisCount: widget.crossAxisCount,
            crossAxisSpacing: widget.crossAxisSpacing,
            mainAxisSpacing: widget.mainAxisSpacing,
            crossAxisAlignment: widget.rowCrossAxisAlignment,
          ),
      loadingBuilder:
          (context) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SpinKitSpinningLines(
              color: Theme.of(context).colorScheme.secondary,
              size: 50.0,
            ),
          ),
      errorBuilder:
          (context) => Service.errorWidgetBuilder(
            context,
            error: _error,
            service: null,
            orElse: (error) => Text('Error: $error'),
          ),
    );
  }
}

class _GridRow extends StatelessWidget {
  const _GridRow({
    required this.columnIndex,
    required this.builder,
    required this.itemCount,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.crossAxisAlignment,
  });
  final IndexedWidgetBuilder builder;
  final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final CrossAxisAlignment crossAxisAlignment;
  final int columnIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: (columnIndex == 0) ? 0 : mainAxisSpacing),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: List.generate((crossAxisCount * 2) - 1, (rowIndex) {
          final rowNum = rowIndex + 1;
          if (rowNum % 2 == 0) {
            return SizedBox(width: crossAxisSpacing);
          }
          final rowItemIndex = ((rowNum + 1) ~/ 2) - 1;
          final itemIndex = (columnIndex * crossAxisCount) + rowItemIndex;
          if (itemIndex > itemCount - 1) {
            return const Expanded(child: SizedBox());
          }
          return Expanded(child: builder(context, itemIndex));
        }),
      ),
    );
  }
}
