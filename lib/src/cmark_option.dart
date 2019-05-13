// ref: https://github.com/commonmark/cmark/blob/ecd0c8c23f011e845ca96704b154083c0f07a994/src/cmark.h#L536
enum CMarkOption {
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
  static int optionsToValue(List<CMarkOption> options) {
    var optionValues =
        options.map((option) => CMarkOptionHelper.optionToValue(option));
    return optionValues.fold(
        CMarkOptionHelper.optionToValue(CMarkOption.defaultValue),
        (previous, option) => previous | option);
  }

  static int optionToValue(CMarkOption option) {
    switch (option) {
      case CMarkOption.defaultValue:
        return 0;
      case CMarkOption.sourcepos:
        return 1 << 1;
      case CMarkOption.hardbreaks:
        return 1 << 2;
      case CMarkOption.safe:
        return 1 << 3;
      case CMarkOption.unsafe:
        return 1 << 17;
      case CMarkOption.nobreaks:
        return 1 << 4;
      case CMarkOption.normalize:
        return 1 << 8;
      case CMarkOption.validateUtf8:
        return 1 << 9;
      case CMarkOption.smart:
        return 1 << 10;
      default:
        return 0;
    }
  }
}
