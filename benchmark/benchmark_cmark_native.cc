#include <dlfcn.h>
#include <string.h>
#include <chrono>
#include <fstream>
#include <iostream>

typedef char *(*cmark_markdown_to_html)(const char *text, int len, int options);

using namespace std;
using namespace std::chrono;

int main(int argc, char const *argv[]) {
    auto working_dir = realpath(".", NULL);
    auto library_path = "../lib/src/cmark/build/src/libcmark.dylib";
    auto dylib = dlopen(library_path, RTLD_LAZY);
    if (dylib == NULL) {
        cout << "Unable to load " << library_path << endl;
        return 1;
    }
    auto markdown_to_html =
        (cmark_markdown_to_html)dlsym(dylib, "cmark_markdown_to_html");

    ifstream stream("sample.md");
    auto sample_markdown =
        string(istreambuf_iterator<char>(stream), istreambuf_iterator<char>())
            .c_str();
    auto length = strlen(sample_markdown);

    auto start = high_resolution_clock::now();
    for (int i = 0; i < 100; i++) {
        markdown_to_html(sample_markdown, length, 0);
    }
    auto elapsed = high_resolution_clock::now() - start;
    cout << "cmark (native): " << elapsed.count() << endl;

    return 0;
}
