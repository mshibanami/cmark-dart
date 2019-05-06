import 'dart:io';
import 'package:markdown/markdown.dart';
import 'package:cmark/src/cmark.dart';

main(List<String> args) {
  var sampleMarkdown = File("benchmark/sample.md").readAsStringSync();
  sleep(Duration(seconds: 1));

  measure(
      "cmark",
      () => {
            for (var i = 0; i < 100; i++) CMark().markdownToHtml(sampleMarkdown)
          });

  measure("markdown",
      () => {for (var i = 0; i < 100; i++) markdownToHtml(sampleMarkdown)});
}

void measure(String label, Function process) {
  var startTime = DateTime.now();
  process();
  var elapsedTime = DateTime.now().difference(startTime);
  print("${label}: ${elapsedTime}");
}
