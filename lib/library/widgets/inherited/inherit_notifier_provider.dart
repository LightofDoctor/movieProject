import 'package:flutter/material.dart';
class InheritedNotifierProvider<T extends ChangeNotifier> extends InheritedNotifier<T> {
  final T model;
  const   InheritedNotifierProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );
  static T? watch<T extends ChangeNotifier>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedNotifierProvider<T>>()?.model;
  }
  static T? read<T extends ChangeNotifier>(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<InheritedNotifierProvider<T>>()?.widget;
    return (widget as InheritedNotifierProvider<T>?)?.model;
  }
}