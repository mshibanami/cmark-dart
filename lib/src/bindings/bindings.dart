import 'dart:ffi';

import '../ffi/cstring.dart';
import '../ffi/dylib_utils.dart';
import 'signatures.dart';
import 'types.dart';

class _CMarkBindings {
  DynamicLibrary library;

  CString Function(CString text, int len, int options) markdownToHtml;
  Pointer<CMarkNode> Function(CString buffer, int len, int options)
      parseDocument;

  _CMarkBindings() {
    library = dlopenPlatformSpecific("cmark", path: "lib/src/cmark/build/src/");

    markdownToHtml = library
        .lookup<NativeFunction<CmarkMarkdownToHtmlOp>>(
            "cmark_markdown_to_html")
        .asFunction();

    parseDocument = library
        .lookup<NativeFunction<CmarkParseDocumentOp>>(
            "cmark_parse_document")
        .asFunction();
  }
}

_CMarkBindings _cachedBindings;
_CMarkBindings get bindings => _cachedBindings ??= _CMarkBindings();
