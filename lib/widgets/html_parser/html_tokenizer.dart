// import 'package:hispanosmobile/widgets/html_parser/html_tokens.dart';
// import 'package:hispanosmobile/widgets/html_parser/states.dart';
// import 'dart:convert' show utf8;

// class HtmlTokenizer {
//   HtmlTokenizerState _currentState = HtmlTokenizerState.dataState;
//   HtmlTokenizerState? _returnState;
//   int _cursor = 0;
//   HtmlToken? _currentToken;
//   HtmlTokenizerState get currentState => _currentState;
//   String? _tempBuffer;
//   List<HtmlToken> _HtmlElementsStack = [];

//   run(String html) {
//     while (_cursor <= html.length) {
//       if (_cursor == html.length) {
//         return _emit(EndOfFileToken());
//       }
//       _consume(html[_cursor]);
//       _cursor++;
//     }
//   }

//   _consume(String char) {
//     if (_currentState == HtmlTokenizerState.dataState) {
//       _handleDataState(char);
//     }
//     if (_currentState == HtmlTokenizerState.rcDataState) {
//       _handleRCDATAState(char);
//     }
//     if (_currentState == HtmlTokenizerState.rawTextState) {
//       _handleRAWTEXTState(char);
//     }
//     if (_currentState == HtmlTokenizerState.tagOpenState) {
//       _handleTagOpenState(char);
//     }
//     if (_currentState == HtmlTokenizerState.tagNameState) {
//       _handleTagNameState(char);
//     }
//     if (_currentState == HtmlTokenizerState.scriptDataState) {
//       _handleScriptDataState(char);
//     }
//     if (_currentState == HtmlTokenizerState.plainTextState) {
//       _handlePlainTextState(char);
//     }
//   }

//   _handleDataState(String currentInputChar) {
//     if (currentInputChar == '&') {
//       return _currentState = HtmlTokenizerState.characterReferenceState;
//     }

//     if (currentInputChar == "<") {
//       return _currentState = HtmlTokenizerState.tagOpenState;
//     }
//     return _emit(CharacterToken(currentInputChar));
//   }

//   _handleRCDATAState(String currentInputChar) {
//     if (currentInputChar == '&') {
//       _returnState = HtmlTokenizerState.rcDataState;
//       return _currentState = HtmlTokenizerState.characterReferenceState;
//     }

//     if (currentInputChar == '<') {
//       return _currentState = HtmlTokenizerState.rcDataLessThanSignState;
//     }

//     if (utf8.encode(currentInputChar)[0] == 0) {
//       return _emit(CharacterToken('�'));
//     }
//     return _emit(CharacterToken(currentInputChar));
//   }

//   _handleRAWTEXTState(String currentInputChar) {
//     if (currentInputChar == '<') {
//       return _currentState = HtmlTokenizerState.rawTextLessThanSignState;
//     }
//     if (utf8.encode(currentInputChar)[0] == 0) {
//       return; // Emit current replacement character token;
//     }
//     return; // Emit the current input charactyer
//   }

//   _handleScriptDataState(String currentInputChar) {
//     if (currentInputChar == '<') {
//       return _currentState = HtmlTokenizerState.scriptDataLessThanSignState;
//     }

//     if (utf8.encode(currentInputChar)[0] == 0) {
//       return _emit(CharacterToken('�'));
//     }

//     return _emit(CharacterToken(currentInputChar));
//   }

//   _handlePlainTextState(String currentInputChar) {
//     if (utf8.encode(currentInputChar)[0] == 0) {
//       return _emit(CharacterToken('�'));
//     }
//     return _emit(CharacterToken(currentInputChar));
//   }

//   _handleTagOpenState(String currentInputChar) {
//     if (currentInputChar == '!') {
//       return _currentState = HtmlTokenizerState.markupDeclarationOpenState;
//     }
//     if (currentInputChar == "/") {
//       return _currentState = HtmlTokenizerState.endTagOpenState;
//     }

//     if (currentInputChar.contains(RegExp('AZaz09'))) {
//       _currentState = HtmlTokenizerState.tagNameState;
//       _currentToken = StartTagToken();
//       _consume(currentInputChar);
//       return;
//     }

//     if (currentInputChar == "?") {
//       _currentToken = CommentToken('');
//       _currentState = HtmlTokenizerState.bogusCommentState;
//       _consume(currentInputChar);
//       return;
//     }

//     _currentState = HtmlTokenizerState.dataState;
//     _currentToken = CommentToken('');
//     _consume(currentInputChar);
//   }

//   _handleEndTagOpenState(String currentInputChar) {
//     if (currentInputChar.contains(RegExp('AZaz09'))) {
//       _currentState = HtmlTokenizerState.tagNameState;
//       return _consume(currentInputChar);
//     }

//     if (currentInputChar == '>') {
//       return _currentState = HtmlTokenizerState.dataState;
//     }

//     _currentToken = CommentToken('');
//     _currentState = HtmlTokenizerState.bogusCommentState;
//     _consume(currentInputChar);
//   }

//   _handleTagNameState(String currentInputChar) {
//     if (["\\", "\n", "\f", " "].contains(currentInputChar)) {
//       return _currentState = HtmlTokenizerState.beforeHtmlAttributeNameState;
//     }

//     if (currentInputChar == '/') {
//       return _currentState = HtmlTokenizerState.selfClosingStartTagState;
//     }

//     if (currentInputChar == '>') {
//       _emit(_currentToken!);
//       _currentToken = null;
//       return;
//     }

//     if (currentInputChar.contains(RegExp('[AZaz]'))) {
//       return (_currentToken! as StartTagToken)
//           .appendCharacter(currentInputChar.toLowerCase());
//     }

//     if (utf8.encode(currentInputChar)[0] == 0) {
//       return (_currentToken as StartTagToken).appendCharacter('�');
//     }

//     // Emit the current input character as character token
//     return _emit(CharacterToken(currentInputChar));
//   }

//   _handleRCDATALessThanSignState(String currentInputChar) {
//     if (currentInputChar == '/') {
//       _tempBuffer = '';
//       return _currentState = HtmlTokenizerState.rcDataEndTagOpenState;
//     }
//     _emit(CharacterToken('<'));
//     _currentState = HtmlTokenizerState.rcDataState;
//     _consume(currentInputChar);
//   }

//   _handleRCDATAEndtagNameState() {}

//   emit(HtmlToken token) {}
// }
