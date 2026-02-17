# fastmem

**fastmem** is a high‑performance x86_64 assembly library that provides memory and string utility functions.

It is designed to be used from C and C++ programs, offering fast, low‑level implementations of commonly used memory and string operations.


---

## Features

- Written fully in x86_64 assembly

- Optimized memory and string routines

- Compatible with C and C++

- Static library (.a) output

- Clean and simple API



---

## Implemented Functions

### Memory functions

`fm_memcpy`

`fm_memmove`

`fm_memcmp`

`fm_memset`

`fm_bzero`

`fm_memchr`

`fm_memrchr`

`fm_mempcpy`

`fm_memccpy`

`fm_memswap`

`fm_memxor`

`fm_memdiff`

`fm_timingsafe_memcmp`

`fm_memmem`

`fm_memcount`

`fm_memnot`

`fm_memhas`

`fm_memiszero`

`fm_memne`

`fm_memcasecmp`

`fm_memchr_not`

`fm_memindex`

`fm_memall_eq`

`fm_memset32`

`fm_memreverse`

`fm_memchr2`

`fm_memfindnot`

`fm_memrun`

`fm_memhash64`

### String functions

`fm_strlen`

`fm_strnlen`

`fm_strchr`

`fm_strrchr`

`fm_strcmp`

`fm_strncmp`

`fm_strcpy`

`fm_strncpy`

`fm_stpcpy`

`fm_strspn`

`fm_strcspn`

`fm_strpbrk`

`fm_strcat`

`fm_strncat`

`fm_strstr`

`fm_strrev`

`fm_strcount`

`fm_strcmp_i`

`fm_strstartswith`

`fm_strendswith`

`fm_strnchr`

`fm_strnrev`

`fm_strisalnum`

`fm_strcmp_eq`

`fm_strncmp_i`

`fm_strtrim`

`fm_strisempty`

`fm_strnstartswith`

`fm_strskip`

`fm_strnendswith`

`fm_strchrnul`

`fm_strcount_char`

`fm_align_up`

`fm_strisalpha`

`fm_strisdigit`

`fm_strisspace`

`fm_strisprint`

`fm_strislower`

`fm_strisupper`

`fm_strisxdigit`

`fm_strisascii`

`fm_strtolower`

`fm_strtoupper`

---

## Architecture:
  - amd64 (x86_64, 64-bit)
## Platform:
  - Linux only

## Setup

**Clone the repository and navigate to the project directory:**

```bash
git clone https://github.com/s-r-e-e-r-a-j/fastmem.git
cd fastmem
```
A `setup.sh` script is provided to **check for NASM and make**, install them if missing, and **build the library automatically**.

Supported distributions:
- Debian / Ubuntu
- RHEL / CentOS / Fedora
- Arch Linux

Run the setup script:

```bash
chmod +x setup.sh
./setup.sh
```

The script will:
- Check whether NASM and make are installed
- Install NASM and make if missing
- Build the fastmem library

After completion, a `build` directory will be generated containing:
- Object files (`.o`)
- Static library (`libfastmem.a`)

## Header File
The `fastmem.h` header is located in the `include`/ directory.
It provides the public API for the fastmem library and exposes all memory and string functions implemented in x86_64 assembly.
The header is designed to be compatible with both C and C++ programs.

- Uses standard C types from `<stddef.h>`
- Uses `extern "C"` for C++ compatibility
- Declares all fastmem functions

### Using the Header
The `fastmem.h` header is located in the `include/` directory.
To use the `fastmem` library in your program, you must tell the compiler where the `include/` directory is, then include the header in your source code.

**Step 1: Include the header in your source code**

```c
#include <fastmem.h>
```

**Step 2: Provide the include path when compiling**

When compiling from another directory, add the `include/` path using `-I`:
```bash
gcc main.c -I/path/to/fastmem/include
```
**Notes**
- `<fastmem.h>` is used for external libraries
- The compiler does not search your project automatically
- The `-I` option tells the compiler where to find `fastmem.h`

## Function Reference

1. `void *fm_memcpy(void *dst, const void *src, size_t n);`

 Copies `n` bytes from `src` to `dst.`
- `dst` → destination buffer
- `src` → source buffer
- `n` → number of bytes to copy
  
Behavior is undefined if memory regions overlap.

Returns the original pointer `dst`.

---

2. `void *fm_memmove(void *dst, const void *src, size_t n);`

Copies `n` bytes from `src` to `dst`, safely handling overlapping regions.

- `dst` → destination buffer
- `src` → source buffer
- `n` → number of bytes to copy

Safe replacement for `memcpy` when overlap is possible.

Returns the original pointer `dst`.

---

3. `int fm_memcmp(const void *a, const void *b, size_t n);`

Compares the first `n` bytes of two memory blocks.
- `a`, `b` → memory blocks to compare
- `n` → number of bytes

Returns:
- `0` if equal
- `< 0` if `a < b`
- `> 0` if `a > b`

---

4. `void *fm_memset(void *s, int c, size_t n);`

Fills a memory block with a byte value.
- `s` → memory block
- `c` → byte value
- `n` → number of bytes

Returns the original pointer `s`.

---

5. `void fm_bzero(void *s, size_t n);`

Sets `n` bytes of memory to zero.
- `s` → memory block
- `n` → number of bytes

---

6. `void *fm_memchr(const void *s, int c, size_t n);`

Searches for the first occurrence of byte `c` in memory.
- `s` → memory block
- `c` → byte to search
- `n` → number of bytes

Returns a pointer to the first occurrence of `c` in `s`, or `NULL` if not found.

---

7. `void *fm_memrchr(const void *s, int c, size_t n);`

Searches for the last occurrence of byte `c` in memory.
- `s` → memory block
- `c` → byte to search
- `n` → number of bytes

Returns a pointer to the last occurrence of `c` in `s`, or `NULL` if not found.

---

8. `void *fm_mempcpy(void *dst, const void *src, size_t n);`

Copies `n` bytes from `src` to `dst` and returns a pointer to the byte after the last copied byte.

- `dst` → destination buffer
- `src` → source buffer
- `n` → number of bytes

---

9. `void *fm_memccpy(void *dst, const void *src, int c, size_t n);`
   
Copies bytes from `src` to `dst` until character `c` is found or `n` bytes are copied.

- `dst` → destination buffer
- `src` → source buffer
- `c` → stopping character
- `n` → number of bytes

Returns pointer to the next byte after `c` in `dst`, or `NULL` if `c` not found.

---

10. `void fm_memswap(void *a, void *b, size_t n);`

Swaps `n` bytes between two memory regions.
- `a` → first memory buffer
- `b` → second memory buffer
- `n` → number of bytes to swap

Both memory regions must be valid and at least `n` bytes long.
Behavior is undefined if the memory regions overlap.

Returns nothing.

---

11. `void fm_memxor(void *dst, const void *src, size_t n);`

Performs a byte-wise XOR between `dst` and `src` and stores the result in `dst`.
- `dst` → destination buffer (modified in place)
- `src` → source buffer
- `n` → number of bytes to process

No value is returned.

---

12. `int fm_memdiff(const void *a, const void *b, size_t n);`

Finds the first differing byte between two memory blocks.
- `a` → first memory block
- `b` → second memory block
- `n` → number of bytes to compare
  
Returns the zero-based index of the first differing byte, or `n` if both blocks are identical.

---

13. `int fm_timingsafe_memcmp(const void *a, const void *b, size_t n);`

Compares two memory blocks in constant time.
- `a` → first memory block
- `b` → second memory block
- `n` → number of bytes to compare

Returns `0` if both blocks are equal, or non-zero if they differ.
Execution time does not depend on the contents of memory.

---

14. `void *fm_memmem(const void *haystack, size_t haystack_len, const void *needle, size_t needle_len);`

Searches for the first occurrence of a memory block within another memory block.
- `haystack` → memory block to search in
- `haystack_len` → size of haystack in bytes
- `needle` → memory block to search for
- `needle_len` → size of needle in bytes

Returns a pointer to the first occurrence of `needle` in `haystack`.
If `needle_len` is `0`, returns `haystack`.
Returns `NULL` if needle is not found.

---

15. `size_t fm_memcount(const void *s, int c, size_t n);`

Counts the number of occurrences of byte `c` in the first `n` bytes of memory block `s`.
- `s` → pointer to the memory block
- `c` → byte value to count
- `n` → number of bytes to examine

Returns the number of times `c` appears in the memory block.

---

16. `void *fm_memnot(void *s, size_t n);`

Performs a bitwise NOT operation on each of the first `n` bytes of memory block `s`.
- `s` → pointer to the memory block
- `n` → number of bytes to modify

Each byte is inverted in place.

Returns the original pointer `s`.

---

17. `int fm_memhas(const void *buf, size_t len, unsigned char byte);`

Checks whether a given `byte` exists in a memory block.

- `buf` → pointer to memory buffer
- `len` → number of bytes to examine
- `byte` → byte value to search for
  
Returns `1` if the byte is found, otherwise `0`.

---

18. `int fm_memiszero(const void *buf, size_t len);`

Checks whether all bytes in a memory block are zero.

- `buf` → pointer to memory buffer
- `len` → number of bytes to examine

Returns `1` if all bytes are zero, otherwise `0`.

---

19. `int fm_memne(const void *a, const void *b, size_t len);`

Compares two memory blocks for inequality.
- `a` → pointer to first memory block
- `b` → pointer to second memory block
- `len` → number of bytes to compare

Returns `1` if the memory blocks differ, otherwise `0`.

---

20. `int fm_memcasecmp(const void *a, const void *b, size_t len);`

Compares the first `len` bytes of two memory areas case-insensitively.
- `a` → first memory area
- `b` → second memory area
- `len` → number of bytes to compare
  
Returns:
- `0` → memory areas are equal ignoring case
- `<0` → first differing byte in `a` is less than in `b`
- `>0` → first differing byte in `a` is greater than in `b`

---

21. `void *fm_memchr_not(const void *buf, int c, size_t len);`

Searches a memory area for the first byte that does NOT match `c`.
- `buf` → memory area
- `c` → byte value to skip
- `len` → number of bytes to search

Returns:
- Pointer to the first byte not equal to `c`
- NULL (0) if all bytes in the range equal `c`

---

22. `size_t fm_memindex(const void *buf, size_t len, int byte);`

Finds the first occurrence of a byte value in a memory block.
- `buf` → memory buffer
- `len` → number of bytes to scan
- `byte` → byte value to search

Returns the zero-based index of the first match.

Returns `(size_t)-1` if the value is not found.

---

23. `int fm_memall_eq(const void *buf, size_t len, int byte);`

Checks whether all bytes in a memory block match a given value.

- `buf` → memory buffer
- `len` → number of bytes to check
- `byte` → value to compare

Returns `1` if all bytes are equal.

Returns `0` if any byte differs.

---

24. `void *fm_memset32(void *buf, size_t count, uint32_t value);`

Fills memory using a 32-bit value.
- `buf` → destination buffer
- `count` → number of 32-bit elements to write
- `value` → 32-bit value to store

Writes value repeatedly into memory.

Returns the original pointer buf.

---

25. `void *fm_memreverse(void *ptr, size_t n);`

Reverses the order of `n` bytes in memory in-place.
- `ptr` → pointer to memory block
- `n` → number of bytes

Returns the original pointer `ptr`

---

26. `void *fm_memchr2(const void *ptr, int a, int b, size_t n);`

Searches for the first occurrence of either of two byte values.
- `ptr` → memory to search
- `a` → first byte value
- `b` → second byte value
- `n` → number of bytes to search

Returns pointer to first matching byte

Returns `NULL` if not found

---

27. `void *fm_memfindnot(const void *ptr, int value, size_t n);`

Finds the first byte not equal to the specified value.
- `ptr` → memory to search
- `value` → byte value to compare
- `n` → number of bytes to search

Returns pointer to first non-matching byte

Returns `NULL` if all bytes match

---

28. `size_t fm_memrun(const void *ptr, int value, size_t n);`

Counts how many bytes at the start are the same as the given value, stopping when a different byte appears.

- `ptr` → memory block
- `value` → byte value to match
- `n` → maximum number of bytes to examine

Returns how many matching bytes appear in a row from the start.

---

29. `uint64_t fm_memhash64(const void *ptr, size_t n);`

Computes a simple 64-bit non-cryptographic hash of memory.

- `ptr` → memory block
- `n` → number of bytes

Returns 64-bit hash value

Same input produces same output

---

30. `size_t fm_strlen(const char *s);`

Returns the length of a null-terminated string.
- `s` → string

Does not include the null terminator.

---

31. `size_t fm_strnlen(const char *s, size_t n);`

Returns the length of a string, limited to n characters.
- `s` → string
- `n` → maximum length

---

32. `char *fm_strchr(const char *s, int c);`

Finds the first occurrence of character `c` in a string.
- `s` → string
- `c` → character

Returns a pointer to the first occurrence of `c` in `s`, or `NULL` if not found.

---

33. `char *fm_strrchr(const char *s, int c);`

Finds the last occurrence of character `c` in a string.
- `s` → string
- `c` → character

Returns a pointer to the last occurrence of `c` in `s`, or `NULL` if not found.

---

34. `int fm_strcmp(const char *a, const char *b);`

Compares two strings.
- `a`, `b` → strings

Returns:
- `0` if equal
- `< 0` if `a < b`
- `> 0` if `a > b`

---

35. `int fm_strncmp(const char *a, const char *b, size_t n);`

Compares up to `n` characters of two strings.
- `a`, `b` → strings
- `n` → max characters

Returns:

- `0` if equal
- `< 0` if `a < b`
- `> 0` if `a > b`

---

36. `char *fm_strcpy(char *dst, const char *src);`
 
Copies a null-terminated string from `src` to `dst`.

- `dst` → destination buffer
- `src` → source string

Returns a pointer to `dst`.

---

37. `char *fm_strncpy(char *dst, const char *src, size_t n);`

Copies up to `n` characters from `src` to `dst`.

- `dst` → destination buffer
- `src` → source string
- `n` → maximum number of characters

Returns a pointer to `dst`.

---

38. `char *fm_stpcpy(char *dst, const char *src);`

Copies a null-terminated string from `src` to `dst`.

- `dst` → destination buffer
- `src` → source string

Returns pointer to the null terminator in `dst`.

---

39. `size_t fm_strspn(const char *s, const char *accept);`

Counts how many characters from the beginning of `s` match characters in `accept`.

- `s` → string
- `accept` → characters to match

Returns the count.

---

40. `size_t fm_strcspn(const char *s, const char *reject);`

Counts characters from the start of `s` until a character from `reject` is found.

- `s` → string
- `reject` → characters not allowed

Returns the count.

---

41. `char *fm_strpbrk(const char *s, const char *accept);`

Finds the first occurrence in `s` of any character from `accept`.

- `s` → string
- `accept` → characters to search for

Returns a pointer to the first matching character, or `NULL` if none found.

---

42. `char *fm_strcat(char *dst, const char *src);`

Appends the string `src` to the end of `dst`.
- `dst` → destination string (must have enough space)
- `src` → source string
  
Returns the original pointer `dst`.

---

43. `char *fm_strncat(char *dst, const char *src, size_t n);`

Appends at most `n` characters from `src` to `dst`.
- `dst` → destination string (must have enough space)
- `src` → source string
- `n` → maximum number of characters to append
  
Returns the original pointer `dst`.

---

44. `char *fm_strstr(const char *haystack, const char *needle);`

Finds the first occurrence of the string `needle` in `haystack`.

- `haystack` → string to search in
- `needle` → substring to search for
  
Returns a pointer to the first occurrence, or `NULL` if not found.

---

45. `char *fm_strrev(char *s);`

Reverses the string `s` in place.

- `s` → string to reverse

Returns the original pointer `s`.

---

46. `size_t fm_strcount(const char *s, int c);`

Counts the number of occurrences of character `c` in the string `s`.

- `s` → input string
- `c` → character to count

Returns the number of occurrences.

---

47. `int fm_strcmp_i(const char *a, const char *b);`

Compares two strings case-insensitively.
- `a` → first string
- `b` → second string
  
Returns:
- `0` if equal
- `< 0` if `a < b`
- `> 0` if `a > b`

---

48. `int fm_strstartswith(const char *str, const char *prefix);`

Checks whether a string starts with a given prefix.
- `str` → input string
- `prefix` → prefix to test

Returns `1` if `str` starts with `prefix`, otherwise `0`.

---

49. `int fm_strendswith(const char *str, const char *suffix);`

Checks whether a string ends with a given suffix.
- `str` → input string
- `suffix` → suffix to test

Returns `1` if `str` ends with `suffix`, otherwise `0`.

---

50. `char *fm_strnchr(const char *s, int c, size_t n);`

Searches for the first occurrence of character `c` in string `s`, examining at most `n` bytes.
- `s` → pointer to the string
- `c` → character to search for
- `n` → maximum number of bytes to scan

Stops early if a null terminator is encountered.

Returns a pointer to the matched character, or `NULL` if not found.

---

51. `char *fm_strnrev(char *s, size_t n);`

Reverses the first `n` bytes of string `s` in place.

- `s` → pointer to the string (or buffer)
- `n` → number of bytes to reverse
  
Reverses exactly `n` bytes. does NOT stop at the null terminator.

Returns the original pointer `s`.

---

52. `int fm_strisalnum(const char *s);`

Checks whether the string `s` contains only alphanumeric characters.
- `s` → pointer to the string

Valid characters are `A–Z`, `a–z`, and `0–9`.
Returns `1` if all characters are alphanumeric or the string is empty, otherwise returns `0`.

---

53. `int fm_strcmp_eq(const char *a, const char *b);`

Checks whether two null-terminated strings are equal.

- `a` → pointer to first string
- `b` → pointer to second string

Returns `1` if strings are equal, otherwise `0`.

---

54. `int fm_strncmp_i(const char *a, const char *b, size_t n);`

Performs a case-insensitive comparison of two strings up to `n` characters
(ASCII only).

- `a` → pointer to first string
- `b` → pointer to second string
- `n` → maximum number of characters to compare

Returns `1` if strings are equal (ignoring case), otherwise `0`.

---

55. `char *fm_strtrim(char *s);`

Removes leading and trailing ASCII bytes ≤ 0x20 (spaces and control characters)
from a string in place.

- `s` → pointer to a mutable null-terminated string

Returns a pointer to the trimmed string.

---

56. `int fm_strisempty(const char *s);`

Checks whether a string is empty.

- `s` → pointer to a null-terminated string

Returns `1` if the string is empty (""), otherwise `0`.

---

57. `int fm_strnstartswith(const char *s, const char *prefix, size_t n);`

Checks if string `s` starts with `prefix` within the first `n` characters.
- `s` → string to check
- `prefix` → prefix to match
- `n` → maximum number of characters to consider

Returns:
- `1` → `s` starts with `prefix`
- `0` → otherwise

---

58. `char *fm_strskip(const char *s, char c);`

Skips all leading occurrences of character `c` in string `s`.
- `s` → string to process
- `c` → character to skip

Returns:
- Pointer to the first character in `s` that is not `c`
- If all characters are `c`, returns pointer to null terminator

---

59. `int fm_strnendswith(const char *s, const char *suffix, size_t n);`

Checks if string `s` ends with `suffix`, considering at most the last `n` characters.
- `s` → string to check
- `suffix` → suffix to match
- `n` → maximum number of characters from end to consider

Returns:
- `1` → `s` ends with suffix within `n` chars
- `0` → otherwise

---

60. `char *fm_strchrnul(const char *s, int c);`

Finds a character in a string or returns the string terminator.

- `s` → null-terminated string
- `c` → character to search

Returns a pointer to the first occurrence of `c`.
If not found, returns a pointer to the null terminator.

---

61. `size_t fm_strcount_char(const char *s, int c);`

Counts how many times a character appears in a string.
- `s` → null-terminated string
- `c` → character to count

Returns the number of occurrences of `c`.

---

62. `size_t fm_align_up(size_t value, size_t align);`

Aligns a value upward to the nearest boundary.
- `value` → input value
- `align` → alignment (power of two)

Returns the smallest aligned value greater than or equal to value.

---

63. `int fm_strisalpha(const char *s);`

Checks whether all characters in the string are alphabetic ASCII letters.

`s` → pointer to null-terminated string

Returns `1` if all characters are in range `A–Z` or `a–z`

Returns `0` otherwise

---

64. `int fm_strisdigit(const char *s);`

Checks whether all characters in the string are decimal digits.

- `s` → pointer to null-terminated string

Returns `1` if all characters are in range `0–9`

Returns `0` otherwise

---

65. `int fm_strisspace(const char *s);`

Checks whether all characters in the string are ASCII whitespace.

- `s` → pointer to null-terminated string

Whitespace characters: space, tab, newline, carriage return, vertical tab, form feed

Returns `1` if all characters are whitespace

Returns `0` otherwise

---

66. `int fm_strisprint(const char *s);`

Checks whether all characters in the string are printable ASCII.

- `s` → pointer to null-terminated string

Printable range: `0x20` to `0x7E`

Returns `1` if all characters are printable

Returns `0` otherwise

---

67. `int fm_strislower(const char *s);`

Checks whether all characters in the string are lowercase ASCII letters.

- `s` → pointer to null-terminated string

Returns `1` if all characters are in range `a–z`

Returns `0` otherwise

---

68. `int fm_strisupper(const char *s);`

Checks whether all characters in the string are uppercase ASCII letters.

- `s` → pointer to null-terminated string

Returns `1` if all characters are in range `A–Z`

Returns `0` otherwise

---

69. `int fm_strisxdigit(const char *s);`

Checks whether all characters in the string are hexadecimal digits.

- `s` → pointer to null-terminated string

Valid characters: `0–9`, `A–F`, `a–f`

Returns `1` if all characters are hexadecimal digits

Returns `0` otherwise

---

70. `int fm_strisascii(const char *s);`

Checks whether all characters in the string are valid 7-bit ASCII.

- `s` → pointer to null-terminated string

Returns `1` if all bytes are `≤ 127`

Returns `0` otherwise

---

71. `char *fm_strtolower(char *s);`

Converts uppercase ASCII letters in a string to lowercase in-place.

- `s` → pointer to null-terminated string

Modifies the original buffer

Returns the original pointer `s`

---

72. `char *fm_strtoupper(char *s);`

Converts lowercase ASCII letters in a string to uppercase in-place.

- `s` → pointer to null-terminated string
  
Modifies the original buffer

Returns the original pointer `s`

---

## Compiling and Linking with fastmem
After running `./setup.sh`, the fastmem static library is generated in the `build/` directory.
```text
fastmem/
 ├─ include/fastmem.h
 ├─ build/libfastmem.a

project/
 ├─ main.c   (or main.cpp)
 ```
### Compiling a C program
**Source code (`main.c`)**
```c
#include <fastmem.h>

int main(void) {
    char buf[64];
    fm_memset(buf, 0, sizeof(buf));
    return 0;
}
```
**Compile and link**

```bash
gcc main.c \
  -I/path/to/fastmem/include \
  -L/path/to/fastmem/build \
  -lfastmem -o main
```

### Compiling a C++ program
**Source code (`main.cpp`)**

```cpp
#include <fastmem.h>

int main() {
    char buf[64];
    fm_memset(buf, 0, sizeof(buf));
    return 0;
}
```
**Compile and link**
```bash
g++ main.cpp \
  -I/path/to/fastmem/include \
  -L/path/to/fastmem/build \
  -lfastmem -o main
```
**Important Notes**
- `-I` points to the directory containing `fastmem.h`
- `-L` points to the directory containing `libfastmem.a`
- `-lfastmem` links `libfastmem.a`
- The order matters: source files first, then `-lfastmem`

## License
This project is licensed under the MIT License
