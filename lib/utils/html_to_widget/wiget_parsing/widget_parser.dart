import 'package:hispanosmobile/utils/html_to_widget/interfaces/parser_interface.dart';
import 'package:hispanosmobile/utils/html_to_widget/src/html_input_stream.dart';
import 'package:hispanosmobile/utils/html_to_widget/src/token.dart';
import 'package:hispanosmobile/utils/html_to_widget/src/tokenizer.dart';
import 'package:hispanosmobile/utils/html_to_widget/wiget_parsing/widget_treebuilder.dart';
import 'package:hispanosmobile/widgets/html_parser/html_tokens.dart';

class WidgetParser extends IHtmlParser {

  final WidgetTreeBuilder tree;
  final HtmlTokenizer tokenizer;

  WidgetParser(dynamic input,
      {String? encoding,
      bool parseMeta = true,
      bool lowercaseElementName = true,
      bool lowercaseAttrName = true,
      bool generateSpans = false,
      String? sourceUrl,
      WidgetTreeBuilder? tree})
      : tree = tree ?? WidgetTreeBuilder(),
        tokenizer = input is HtmlTokenizer
            ? input
            : HtmlTokenizer(input,
                encoding: encoding,
                parseMeta: parseMeta,
                lowercaseElementName: lowercaseElementName,
                lowercaseAttrName: lowercaseAttrName,
                generateSpans: generateSpans,
                sourceUrl: sourceUrl) {

    // Avoid passing the parser to not handle the cdatastate
    // tokenizer.parser = this;
  } 

  mainLoop() {
    while(tokenizer.moveNext()) {
      final token = tokenizer.current
      final newToken = token;
      int type;
      while(newToken != null) {
        type = newToken.kind;
        if(type = TokenKind.parseError) {
          final error = newToken as ParseErrorToken();
        }
      }
    }
  }
}
