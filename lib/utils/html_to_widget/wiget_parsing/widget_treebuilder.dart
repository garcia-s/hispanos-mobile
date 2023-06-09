import 'package:flutter/material.dart';
import 'package:hispanosmobile/utils/html_to_widget/interfaces/treebuilder_interface.dart';

class WidgetTreeBuilder extends ITreeBuilder<Widget> {
  @override
  // TODO: implement openElements
  @override
  final List<Widget> openElements = <Widget>[];

  @override
  final String? defaultNamespace = null;

  WidgetTreeBuilder() {
    reset();
  }

  void reset() {
    openElements.clear();
  }
}
