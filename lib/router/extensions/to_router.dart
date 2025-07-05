import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToRoute {
  final String name;
  final Map<String, String> pathParameters;
  final Map<String, String> queryParameters;

  const ToRoute({
    required this.name,
    this.pathParameters = const <String, String>{},
    this.queryParameters = const <String, String>{},
  });
}

extension ToRouterExtension on BuildContext {
  void pushRoute(ToRoute to) {
    GoRouter.of(this).pushNamed(
      to.name,
      pathParameters: to.pathParameters,
      queryParameters: to.queryParameters,
    );
  }

  void goRoute(ToRoute to) {
    GoRouter.of(this).goNamed(
      to.name,
      pathParameters: to.pathParameters,
      queryParameters: to.queryParameters,
    );
  }

 void replaceRoute(ToRoute to) {
    GoRouter.of(this).replaceNamed(
      to.name,
      pathParameters: to.pathParameters,
      queryParameters: to.queryParameters,
    );
  }
}
