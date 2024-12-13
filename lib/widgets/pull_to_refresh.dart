import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class PullToRefresh<T> extends StatefulWidget {
  final T initialData;
  final Widget Function(T data) builder;
  final RefreshController controller;
  final Future<T> Function()? onLoading;
  final Future<T> Function() onRefresh;

  const PullToRefresh({
    super.key,
    required this.initialData,
    required this.builder,
    required this.controller,
    this.onLoading,
    required this.onRefresh,
  });

  @override
  createState() => _PullToRefreshState<T>();
}

class _PullToRefreshState<T> extends State<PullToRefresh<T>> {
  late T _data;

  @override
  initState() {
    super.initState();
    _data = widget.initialData;
  }

  Future<void> _onRefresh() async {
    try {
      final newData = await widget.onRefresh();
      if (mounted) {
        setState(() {
          _data = newData;
        });

        widget.controller.refreshCompleted();
      }
    } catch (err) {
      if (mounted) {
        widget.controller.refreshFailed();
      }
      rethrow;
    }
  }

  Future<void> _onLoading() async {
    try {
      final newData = await widget.onLoading!();
      if (mounted) {
        setState(() {
          _data = newData;
        });

        widget.controller.loadComplete();
      }
    } catch (err) {
      if (mounted) {
        widget.controller.loadFailed();
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: widget.onLoading != null,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: widget.controller,
        onRefresh: _onRefresh,
        onLoading: widget.onLoading == null ? null : _onLoading,
        child: widget.builder(_data));
  }
}
