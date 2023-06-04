enum HtmlTokenType {
  startTag,
  endTag,
  comment,
  character,
  endOfFile,
  unparseable
}

abstract class HtmlToken {
  final HtmlTokenType type;
  final List<HtmlToken> children = [];

  HtmlToken(this.type);
}

class TagAttribute {
  final String name;
  final String value;

  const TagAttribute({
    required this.name,
    required this.value,
  });
}

class DoctypeToken extends HtmlToken {
  DoctypeToken() : super(HtmlTokenType.startTag);
}

class StartTagToken extends HtmlToken {
  String _tagName = '';
  bool selfClosing = false;
  List<TagAttribute> attributes = [];

  String get tagName => _tagName;
  void appendCharacter(String char) => _tagName = _tagName + char;
  StartTagToken() : super(HtmlTokenType.startTag);
}

class EndTagToken extends HtmlToken {
  String _tagName = '';
  bool selfClosing = false;
  List<TagAttribute> attributes = [];

  String get tagName => _tagName;
  void appendCharacter(String char) => _tagName = _tagName + char;
  EndTagToken() : super(HtmlTokenType.endTag);
}

class CommentToken extends HtmlToken {
  String data;
  CommentToken(this.data) : super(HtmlTokenType.comment);
}

class CharacterToken extends HtmlToken {
  final String data;
  CharacterToken(this.data) : super(HtmlTokenType.character);
}

class EndOfFileToken extends HtmlToken {
  EndOfFileToken() : super(HtmlTokenType.endOfFile);
}

class UnparseableToken extends HtmlToken {
  UnparseableToken() : super(HtmlTokenType.unparseable);
}
