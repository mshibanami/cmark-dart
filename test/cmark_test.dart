import 'package:cmark/cmark.dart';
import 'package:cmark/ffi/cstring.dart';
import 'package:test/test.dart';

void main() {
  group('dart:ffi', () {
    setUp(() {});

    test('CString', () {
      var string = "こんにちは";
      var stringC = CString.allocate(string);
      expect(CString.fromUtf8(stringC), equals(string));
      stringC.free();
    });
  });

  group('CMark', () {
    CMark cMark;

    setUp(() {
      cMark = CMark();
    });

    test('markdownToHtml', () {
      expect(cMark.markdownToHtml("Hello"), equals("<p>Hello</p>\n"));
      expect(cMark.markdownToHtml("# Hello"), equals("<h1>Hello</h1>\n"));
      expect(cMark.markdownToHtml("こんにちは"), equals("<p>こんにちは</p>\n"));
    });
  });
}
