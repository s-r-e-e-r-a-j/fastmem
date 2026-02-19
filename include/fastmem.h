// Developer: Sreeraj
// GitHub: https://github.com/s-r-e-e-r-a-j

#ifndef FASTMEM_H
#define FASTMEM_H

#include <stddef.h>
#include <stdint.h>

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
void fm_memswap(void *a, void *b, size_t n);
void fm_memxor(void *dst, const void *src, size_t n);
size_t fm_memdiff(const void *a, const void *b, size_t n);
int fm_timingsafe_memcmp(const void *a, const void *b, size_t n);
void *fm_memmem(const void *haystack, size_t haystack_len, const void *needle, size_t needle_len);
size_t fm_memcount(const void *s, int c, size_t n);
void *fm_memnot(void *s, size_t n);
int fm_memhas(const void *buf, size_t len, unsigned char byte);
int fm_memiszero(const void *buf, size_t len);
int fm_memne(const void *a, const void *b, size_t len);
int fm_memcasecmp(const void *a, const void *b, size_t len);
void *fm_memchr_not(const void *buf, int c, size_t len);
size_t fm_memindex(const void *buf, size_t len, int byte);
int fm_memall_eq(const void *buf, size_t len, int byte);
void* fm_memset32(void *buf, size_t count, uint32_t value);
void *fm_memreverse(void *ptr, size_t n);
void *fm_memchr2(const void *ptr, int a, int b, size_t n);
void *fm_memfindnot(const void *ptr, int value, size_t n);
size_t fm_memrun(const void *ptr, int value, size_t n);
uint64_t fm_memhash64(const void *ptr, size_t n);
uint64_t fm_memsum(const void *ptr, size_t n);
uint8_t fm_memavg(const void *ptr, size_t n);
size_t fm_memreplace(void *ptr, size_t n, int oldv, int newv);
int fm_memisuniform(const void *ptr, size_t n);
void *fm_memrotate_left(void *ptr, size_t n, size_t k);
void *fm_memrotate_right(void *ptr, size_t n, size_t k);
bool fm_memends_with(const void *buf, size_t len, const void *suffix, size_t suffix_len);
void *fm_memchr3(const void *buf, int a, int b, int c, size_t n);
void *fm_memdup_into(void *dst, const void *src, size_t n);
ssize_t fm_memfirst_index(const void *buf, int c, size_t n);
ssize_t fm_memlast_index(const void *buf, int c, size_t n);

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
int fm_strstartswith(const char *str, const char *prefix);
int fm_strendswith(const char *str, const char *suffix);
char *fm_strnchr(const char *s, int c, size_t n);
char *fm_strnrev(char *s, size_t n);
int fm_strisalnum(const char *s);
int fm_strcmp_eq(const char *a, const char *b);
int fm_strncmp_i(const char *a, const char *b, size_t n);
char *fm_strtrim(char *s);
int fm_strisempty(const char *s);
int fm_strnstartswith(const char *s, const char *prefix, size_t n);
char *fm_strskip(const char *s, char c);
int fm_strnendswith(const char *s, const char *suffix, size_t n);
char* fm_strchrnul(const char *s, int c);
size_t fm_strcount_char(const char *s, int c);
size_t fm_align_up(size_t value, size_t align);
int fm_strisalpha(const char *s);
int fm_strisdigit(const char *s);
int fm_strisspace(const char *s);
int fm_strisprint(const char *s);
int fm_strislower(const char *s);
int fm_strisupper(const char *s);
int fm_strisxdigit(const char *s);
int fm_strisascii(const char *s);
char *fm_strtolower(char *s);
char *fm_strtoupper(char *s);
char *fm_strremove_char(char *s, int c);
char *fm_strrepeat(char *dst, const char *pattern, size_t count);
size_t fm_strlcpy(char *dst, const char *src, size_t size);
size_t fm_strlcat(char *dst, const char *src, size_t size);
char *fm_strswapcase(char *s);
char *fm_strstrip_left(char *s);
char *fm_strstrip_right(char *s);

#ifdef __cplusplus
}
#endif

#endif
