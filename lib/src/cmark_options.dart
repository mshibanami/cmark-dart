// ref: https://github.com/commonmark/cmark/blob/ecd0c8c23f011e845ca96704b154083c0f07a994/src/cmark.h#L536
enum CMarkOptions {
  defaultValue,
  sourcepos,
  hardbreaks,
  safe,
  unsafe,
  nobreaks,
  normalize,
  validateUtf8,
  smart
}

class CMarkOptionHelper {
  static int value(CMarkOptions option) {
    switch (option) {
      case CMarkOptions.defaultValue:
        return 0;
      case CMarkOptions.sourcepos:
        return 1 << 1;
      case CMarkOptions.hardbreaks:
        return 1 << 2;
      case CMarkOptions.safe:
        return 1 << 3;
      case CMarkOptions.unsafe:
        return 1 << 17;
      case CMarkOptions.nobreaks:
        return 1 << 4;
      case CMarkOptions.normalize:
        return 1 << 8;
      case CMarkOptions.validateUtf8:
        return 1 << 9;
      case CMarkOptions.smart:
        return 1 << 10;
      default:
        return 0;
    }
  }
}
