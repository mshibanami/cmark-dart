import 'dart:ffi';
import 'dart:io';

import '../ffi/cstring.dart';
import '../ffi/dylib_utils.dart';
import 'signatures.dart';
import 'types.dart';

class _CMarkBindings {
  DynamicLibrary library;

  CString Function(CMarkNodePointer root, int options) cmark_render_html;

  CString Function(CString text, int len, int options) cmark_markdown_to_html;

  _CMarkBindings() {
    library = dlopenPlatformSpecific("cmark");
    cmark_markdown_to_html = library
        .lookup<NativeFunction<cmark_markdown_to_html_native_t>>(
            "cmark_markdown_to_html")
        .asFunction();
  }
}

_CMarkBindings _cachedBindings;
_CMarkBindings get bindings => _cachedBindings ??= _CMarkBindings();
