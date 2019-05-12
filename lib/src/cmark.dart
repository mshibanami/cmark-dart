import '../bindings/bindings.dart';
import '../ffi/cstring.dart';
import 'cmark_options.dart';

class CMark {
  String markdownToHtml(String text,
      {List<CMarkOptions> options = const [],
      List<int> extensions = const []}) {
    var optionValues = options.map((option) => CMarkOptionHelper.value(option));
    var optionValue = optionValues.fold(
        CMarkOptionHelper.value(CMarkOptions.defaultValue),
        (previous, option) => previous | option);
    var textC = CString.allocate(text);
    var renderedC =
        bindings.cmark_markdown_to_html(textC, text.length, optionValue);
    var rendered = CString.fromUtf8(renderedC);
    textC.free();
    renderedC.free();
    return rendered;
  }
}
