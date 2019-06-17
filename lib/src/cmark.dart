import 'package:cmark/src/bindings/types.dart';

import 'bindings/bindings.dart';
import 'ffi/cstring.dart';
import 'cmark_option.dart';

class CMark {
  String markdownToHtml(String commonMarkText,
      {List<CMarkOption> options = const [], List<int> extensions = const []}) {
    var optionsValue = CMarkOptionHelper.optionsToValue(options);
    var textC = CString.allocate(commonMarkText);
    var renderedC = bindings.markdownToHtml(
        textC, commonMarkText.length, optionsValue);
    var rendered = CString.fromUtf8(renderedC);
    textC.free();
    return rendered;
  }

  CMarkNode parse(String commonMarkText,
      {List<CMarkOption> options = const []}) {
    var optionsValue = CMarkOptionHelper.optionsToValue(options);
    var textC = CString.allocate(commonMarkText);
    var nodeC = bindings.parseDocument(
        textC, commonMarkText.length, optionsValue);
    textC.free();
    var node = nodeC.load<CMarkNode>();
    return node;
  }
}
