import 'dart:ffi';

import './../ffi/cstring.dart';

/// cmark_node
@struct
class CMarkNode extends Pointer<Void> {
  // TODO: wait for https://github.com/dart-lang/sdk/issues/36730
  CMarkStrbuf content;

  @Uint32()
  int type;
}

/// cmark_strbuf
@struct
class CMarkStrbuf extends Pointer<Void> {
  @Pointer()
  CMarkMem mem;

  @Pointer()
  CString ptr;

  @Int32()
  int asize;

  @Int32()
  int size;
}

/// cmark_mem
@struct
class CMarkMem extends Pointer<Void> {
  // void *(*calloc)(size_t, size_t);
  // void *(*realloc)(void *, size_t);
  // void (*free)(void *);
}
