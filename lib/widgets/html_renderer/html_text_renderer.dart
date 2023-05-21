import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;

class HtmlRendererWidget extends StatelessWidget {
  final dom.Document document;

  const HtmlRendererWidget({
    super.key,
    required this.document,
  });

  @override
  Widget build(BuildContext context) {
    final content = _mapElementsToString();
    return Text(content != null
        ? content.join(" ")
        : "NO SE PUEDE UTILIZAR EL CONTENIDO");
  }

  List<String>? _mapElementsToString() {
    final _tagRegEx = RegExp('<[^>]+>');
    if (document.body == null) return null;
    final List<String> texts = [];
    for (int i = 0; i < document.body!.children.length; i++) {
      final child = document.body!.children[i];
      texts.add(child.innerHtml.replaceAll(_tagRegEx, ""));
    }
    return texts;
  }
}

class HTMLRenderer {
  Map<String, dynamic>? getTagInfo(String htmlString) {
    final regex = RegExp("<([a-zA-Z]+)([^>]+)>([^<]*)<\\/([a-zA-Z]+)>");
    final match = regex.firstMatch(htmlString);

    if (match != null) {
      final tagName = match.group(1);
      final attributes = match.group(2);
      final innerHTML = match.group(3);

      return {
        'tagName': tagName,
        'attributes': attributes,
        'innerHTML': innerHTML
      };
    } else {
      return null; // Invalid HTML string or no matching tag found
    }
  }
}
