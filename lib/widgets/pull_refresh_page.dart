import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PullRefreshPage<T> extends StatefulWidget {
  final Widget Function(Widget body)? builderError;
  final Widget Function(T data, (bool loading, Future<void> Function() refresh))
  builder;
  final Future<T> Function() onLoadData;
  final T Function() onLoadFake;

  const PullRefreshPage({
    super.key,
    this.builderError,
    required this.builder,
    required this.onLoadData,
    required this.onLoadFake,
  });

  @override
  createState() => _PullRefreshPageState<T>();
}

class _PullRefreshPageState<T> extends State<PullRefreshPage<T>> {
  late Future<T> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = widget.onLoadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<T>(
        future: _dataFuture,
        builder: (context, snapshot) {
          return RefreshIndicator(
            onRefresh: _pullRefresh,
            child: _buildBody(snapshot),
          );
        },
      ),
    );
  }

  Widget _buildMessageBiggest(Widget child) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            SizedBox(
              width: constraints.biggest.width,
              height: constraints.biggest.height,
              child: child,
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody(AsyncSnapshot<T> snapshot) {
    if (snapshot.hasError) {
      final body = _buildMessageBiggest(
        Center(
          child: UtilsService.errorWidgetBuilder(
            context,
            error: snapshot.error,
            service: null,
            orElse: (err) => Text('Error: $err'),
          ),
        ),
      );

      return widget.builderError?.call(body) ?? body;
    }
    final loading = snapshot.connectionState == ConnectionState.waiting;

    if (!loading &&
        (!snapshot.hasData ||
            (snapshot.data is List && (snapshot.data as List).isEmpty))) {
      return _buildMessageBiggest(
        const Center(child: Text('No data available.')),
      );
    }

    var data = loading ? widget.onLoadFake() : snapshot.data!;

    return Skeletonizer(
      enabled: loading,
      enableSwitchAnimation: true,
      child: widget.builder(data, (loading, _pullRefresh)),
    );
  }

  Future<void> _pullRefresh() async {
    final data = await widget.onLoadData();
    setState(() {
      _dataFuture = Future.value(data);
    });
  }
}
