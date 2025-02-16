import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PullRefreshPage<T> extends StatefulWidget {
  final Widget Function(T data, ScrollController? controller) builder;
  final Future<T> Function() onLoadData;
  final Future<T> Function(T oldData, void Function() endList)? onLoadMore;
  final T Function() onLoadFake;

  const PullRefreshPage(
      {super.key,
      required this.builder,
      required this.onLoadData,
      required this.onLoadFake,
      this.onLoadMore});

  @override
  createState() => _PullRefreshPageState<T>();
}

class _PullRefreshPageState<T> extends State<PullRefreshPage> {
  late Future<T> dataFuture;
  late final ScrollController? _scrollController;

  bool _end = false;

  void _endList() {
    _end = true;
  }

  @override
  void initState() {
    super.initState();
    dataFuture = widget.onLoadData() as Future<T>;

    if (widget.onLoadMore != null) {
      _scrollController = ScrollController()
        ..addListener(() {
          if (_scrollController!.position.pixels ==
                  _scrollController.position.maxScrollExtent &&
              !_scrollController.position.outOfRange) {
            if (!_end) {
              setState(() {
                dataFuture =
                    widget.onLoadMore!(dataFuture, _endList) as Future<T>;
              });
            }
          }
        });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<T>(
        future: dataFuture,
        builder: (context, snapshot) {
          return RefreshIndicator(
            onRefresh: _pullRefresh,
            child: _buildBody(snapshot),
          );
        },
      ),
    );
  }

  Widget _buildBody(AsyncSnapshot<T> snapshot) {
    if (snapshot.hasError) {
      return Center(
          child: UtilsService.errorWidgetBuilder(context,
              error: snapshot.error, orElse: (err) => Text('Error: $err')));
    }
    if (!snapshot.hasData) {
      return const Center(child: Text('No data available.'));
    }

    final loading = snapshot.connectionState == ConnectionState.waiting;
    final data = loading ? widget.onLoadFake() : snapshot.data!;

    return Skeletonizer(
        enabled: loading,
        enableSwitchAnimation: true,
        child: widget.builder(data, _scrollController));
  }

  Future<void> _pullRefresh() async {
    final data = await widget.onLoadData() as Future<T>;
    setState(() {
      dataFuture = Future.value(data);
    });
  }
}
