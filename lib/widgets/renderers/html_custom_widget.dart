import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlCustomWidget extends StatelessWidget {
  final String html;
  const HtmlCustomWidget(
    this.html, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(html, customWidgetBuilder: (element) {
      if (["div", 'ol', 'ul', 'hr'].contains(element.localName) ||
          element.innerHtml == '' ||
          element.innerHtml.contains('Notas relacionadas')) {
        return const Offstage();
      }
      if (element.localName == 'iframe') {
        if (element.attributes['src']!.contains('spotify')) {}
        return const Placeholder();
      }
      return null;
    });
  }
}
