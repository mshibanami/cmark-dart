import 'dart:ffi';

import '../ffi/cstring.dart';
import '../ffi/dylib_utils.dart';
import 'signatures.dart';
import 'types.dart';

class _CommonMarkBindings {
  DynamicLibrary commonMark;

  CString Function(CMarkNodePointer root, int options) cmark_render_html;

  CString Function(CString text, int len, int options) cmark_markdown_to_html;

  _CommonMarkBindings() {
    commonMark = dlopenPlatformSpecific("cmark", path: "lib/libcmark/");
    cmark_markdown_to_html = commonMark
        .lookup<NativeFunction<cmark_markdown_to_html_native_t>>(
            "cmark_markdown_to_html")
        .asFunction();
  }
}

_CommonMarkBindings _cachedBindings;
_CommonMarkBindings get bindings => _cachedBindings ??= _CommonMarkBindings();
