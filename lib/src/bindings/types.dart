import 'dart:ffi';

// cmark_node
class CMarkNodePointer extends Pointer<CCMarkNode> {}

@struct
class CCMarkNode extends NativeType {
  Pointer<Uint32> type;
}

class CMarkNode {
  int type;
}
