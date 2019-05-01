import "dart:ffi";
import "../ffi/cstring.dart";
import 'types.dart';

typedef cmark_render_html_native_t = CString Function(
    Pointer<CMarkNodePointer> root, Int32 options);

typedef cmark_markdown_to_html_native_t = CString Function(
    CString text, Uint32 len, Int32 options);
