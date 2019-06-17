#include "main.hpp"
#include <dlfcn.h>
#include <math.h>
#include <string.h>
#include <chrono>
#include <fstream>
#include <iostream>

using namespace std;

int main(int argc, char const *argv[]) {
    auto working_dir = realpath(".", NULL);
    auto library_path = "lib/src/cmark/build/src/libcmark.dylib";
    auto dylib = dlopen(library_path, RTLD_LAZY);
    if (dylib == NULL) {
        cout << "Unable to load " << library_path << endl;
        return 1;
    }
    auto markdown_to_html =
        (cmark_markdown_to_html)dlsym(dylib, "cmark_markdown_to_html");

    auto html = markdown_to_html("hello", 5, 0);
    printf("%s", html);

    auto parse_document =
        (cmark_parse_document)dlsym(dylib, "cmark_parse_document");
    auto text = "# Hello";
    auto len = strlen(text);
    auto parsed = parse_document(text, len, 0);

    return 0;
}
