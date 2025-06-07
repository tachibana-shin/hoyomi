import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToRouter {
  final String name;
  final Map<String, String> pathParameters;
  final Map<String, String> queryParameters;

  const ToRouter({
    required this.name,
    this.pathParameters = const <String, String>{},
    this.queryParameters = const <String, String>{},
  });
}

extension ToRouterExtension on BuildContext {
  pushRouter(ToRouter to) {
    GoRouter.of(this).pushNamed(
      to.name,
      pathParameters: to.pathParameters,
      queryParameters: to.queryParameters,
    );
  }

  goRouter(ToRouter to) {
    GoRouter.of(this).goNamed(
      to.name,
      pathParameters: to.pathParameters,
      queryParameters: to.queryParameters,
    );
  }

  replaceRouter(ToRouter to) {
    GoRouter.of(this).replaceNamed(
      to.name,
      pathParameters: to.pathParameters,
      queryParameters: to.queryParameters,
    );
  }
}
