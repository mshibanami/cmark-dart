import 'package:cmark/cmark.dart';
import 'package:test/test.dart';

void main() {
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

    test("parse", () {
      // var parsed = cMark.parse("# Hello");
    });
  });
}
