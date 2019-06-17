#ifndef MAIN_H
#define MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdio.h>

typedef struct cmark_mem {
    void *(*calloc)(size_t, size_t);
    void *(*realloc)(void *, size_t);
    void (*free)(void *);
} cmark_mem;

typedef int32_t bufsize_t;

typedef struct {
    cmark_mem *mem;
    unsigned char *ptr;
    bufsize_t asize, size;
} cmark_strbuf;

typedef enum {
    CMARK_NO_LIST,
    CMARK_BULLET_LIST,
    CMARK_ORDERED_LIST
} cmark_list_type;

typedef enum {
    CMARK_NO_DELIM,
    CMARK_PERIOD_DELIM,
    CMARK_PAREN_DELIM
} cmark_delim_type;

typedef struct {
    unsigned char *data;
    bufsize_t len;
    bufsize_t alloc;  // also implies a NULL-terminated string
} cmark_chunk;

typedef struct {
    cmark_list_type list_type;
    int marker_offset;
    int padding;
    int start;
    cmark_delim_type delimiter;
    unsigned char bullet_char;
    bool tight;
} cmark_list;

typedef struct {
    cmark_chunk info;
    cmark_chunk literal;
    uint8_t fence_length;
    uint8_t fence_offset;
    unsigned char fence_char;
    int8_t fenced;
} cmark_code;

typedef struct {
    int level;
    bool setext;
} cmark_heading;

typedef struct {
    cmark_chunk url;
    cmark_chunk title;
} cmark_link;

typedef struct {
    cmark_chunk on_enter;
    cmark_chunk on_exit;
} cmark_custom;

struct cmark_node {
    cmark_strbuf content;

    struct cmark_node *next;
    struct cmark_node *prev;
    struct cmark_node *parent;
    struct cmark_node *first_child;
    struct cmark_node *last_child;

    void *user_data;

    int start_line;
    int start_column;
    int end_line;
    int end_column;
    int internal_offset;
    uint16_t type;
    uint16_t flags;

    union {
        cmark_chunk literal;
        cmark_list list;
        cmark_code code;
        cmark_heading heading;
        cmark_link link;
        cmark_custom custom;
        int html_block_type;
    } as;
};

typedef char *(*cmark_markdown_to_html)(const char *text, int len, int options);
typedef cmark_node *(*cmark_parse_document)(const char *buffer, size_t len,
                                            int options);

#ifdef __cplusplus
}
#endif

#endif
