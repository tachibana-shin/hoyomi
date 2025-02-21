import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart'
    as very_good;

class InfiniteList<T> extends StatefulWidget {
  final List<T> data;
  final Future<(bool, List<T>)> Function() fetchData;
  final Widget Function(BuildContext context, T item, int index, T? next)
      itemBuilder;

  const InfiniteList(
      {super.key,
      required this.data,
      required this.fetchData,
      required this.itemBuilder});

  @override
  State<InfiniteList> createState() => _InfiniteListState<T>();
}

class _InfiniteListState<T> extends State<InfiniteList<T>> {
  late List<T> _data;

  Object? _error;
  bool _isLoading = false;
  bool _hasReachedMax = false;
  bool _firstSetup = true;

  @override
  void initState() {
    super.initState();

    _data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return very_good.InfiniteList(
        itemCount: _data.length,
        isLoading: _isLoading,
        hasError: _error != null,
        hasReachedMax: _hasReachedMax,
        centerLoading: true,
        centerError: true,
        onFetchData: () async {
          if (_firstSetup) {
            _firstSetup = false;
            return;
          }
          _isLoading = true;
          setState(() {});

          try {
            final (isLastPage, items) = await widget.fetchData();

            _data.addAll(items);
            _hasReachedMax = isLastPage;
          } catch (err) {
            _error = err;
          } finally {
            _isLoading = false;
            setState(() {});
          }
        },
        itemBuilder: (context, index) => widget.itemBuilder(context,
            _data.elementAt(index), index, _data.elementAtOrNull(index + 1)),
        loadingBuilder: (context) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SpinKitSpinningLines(
                color: Theme.of(context).colorScheme.secondary, size: 50.0)),
        errorBuilder: (context) => UtilsService.errorWidgetBuilder(context,
            error: _error, orElse: (error) => Text('Error: $error')));
  }
}
