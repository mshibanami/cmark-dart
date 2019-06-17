import "dart:ffi";
import "../ffi/cstring.dart";
import 'types.dart';

typedef CmarkMarkdownToHtmlOp = CString Function(
    CString text, Uint32 len, Int32 options);

typedef CmarkRenderHtmlOp = CString Function(
    Pointer<CMarkNode> root, Int32 options);

typedef CmarkParseDocumentOp = Pointer<CMarkNode> Function(
    CString buffer, Uint32 len, Int32 options);
