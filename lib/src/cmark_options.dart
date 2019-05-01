// ref: https://github.com/commonmark/cmark/blob/ecd0c8c23f011e845ca96704b154083c0f07a994/src/cmark.h#L536
class CMarkOptions {
  static const int DEFAULT = 0;
  static const int SOURCEPOS = 1 << 1;
  static const int HARDBREAKS = 1 << 2;
  static const int SAFE = 1 << 3;
  static const int UNSAFE = 1 << 17;
  static const int NOBREAKS = 1 << 4;
  static const int NORMALIZE = 1 << 8;
  static const int VALIDATE_UTF8 = 1 << 9;
  static const int SMART = 1 << 10;
}
