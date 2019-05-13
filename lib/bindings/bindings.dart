import 'dart:ffi';

import '../ffi/cstring.dart';
import '../ffi/dylib_utils.dart';
import 'signatures.dart';
import 'types.dart';

class _CMarkBindings {
  DynamicLibrary library;

  CString Function(CString text, int len, int options) cmark_markdown_to_html;
  Pointer<CMarkNodePointer> Function(CString buffer, int len, int options)
      cmark_parse_document;

  _CMarkBindings() {
    library = dlopenPlatformSpecific("cmark");

    cmark_markdown_to_html = library
        .lookup<NativeFunction<cmark_markdown_to_html_native_t>>(
            "cmark_markdown_to_html")
        .asFunction();

    cmark_parse_document = library
        .lookup<NativeFunction<cmark_parse_document_native_t>>(
            "cmark_parse_document")
        .asFunction();
  }
}

_CMarkBindings _cachedBindings;
_CMarkBindings get bindings => _cachedBindings ??= _CMarkBindings();
