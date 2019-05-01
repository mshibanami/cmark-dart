import '../bindings/bindings.dart';
import '../ffi/cstring.dart';
import 'cmark_options.dart';

class CMark {
  String markdownToHtml(String text,
      {List<int> options = const [CMarkOptions.DEFAULT],
      List<int> extensions = const []}) {
    var textC = CString.allocate(text);
    var renderedC = bindings.cmark_markdown_to_html(textC, text.length, 0);
    var rendered = CString.fromUtf8(renderedC);
    textC.free();
    renderedC.free();
    return rendered;
  }
}
