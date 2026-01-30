// Developer: Sreeraj
// GitHub: https://github.com/s-r-e-e-r-a-j

#ifndef FASTMEM_H
#define FASTMEM_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Memory functions */
void *fm_memcpy(void *dst, const void *src, size_t n);
void *fm_memmove(void *dst, const void *src, size_t n);
int fm_memcmp(const void *a, const void *b, size_t n);
void *fm_memset(void *s, int c, size_t n);
void fm_bzero(void *s, size_t n);
void *fm_memchr(const void *s, int c, size_t n);
void *fm_memrchr(const void *s, int c, size_t n);
void *fm_mempcpy(void *dst, const void *src, size_t n);
void *fm_memccpy(void *dst, const void *src, int c, size_t n);
void *fm_memset_s(void *s, int c, size_t n);
void fm_memxor(void *dst, const void *src, size_t n);

/* String functions */
size_t fm_strlen(const char *s);
size_t fm_strnlen(const char *s, size_t n);
char *fm_strchr(const char *s, int c);
char *fm_strrchr(const char *s, int c);
int fm_strcmp(const char *a, const char *b);
int fm_strncmp(const char *a, const char *b, size_t n);
char *fm_strcpy(char *dst, const char *src);
char *fm_strncpy(char *dst, const char *src, size_t n);
char *fm_stpcpy(char *dst, const char *src);
size_t fm_strspn(const char *s, const char *accept);
size_t fm_strcspn(const char *s, const char *reject);
char *fm_strpbrk(const char *s, const char *accept);
char *fm_strcat(char *dst, const char *src);
char *fm_strncat(char *dst, const char *src, size_t n);
char *fm_strstr(const char *haystack, const char *needle);
char *fm_strrev(char *s);
size_t fm_strcount(const char *s, int c);
int fm_strcmp_i(const char *a, const char *b);

#ifdef __cplusplus
}
#endif

#endif
