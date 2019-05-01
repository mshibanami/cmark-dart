import 'package:cmark/cmark.dart';

main() {
  var cMark = CMark();
  print(cMark.markdownToHtml("# Hello World!"));
}
