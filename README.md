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
A `setup.sh` script is provided to **check, install NASM and make, and automatically build the library**.

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

17. `size_t fm_strlen(const char *s);`

Returns the length of a null-terminated string.
- `s` → string

Does not include the null terminator.

---

18. `size_t fm_strnlen(const char *s, size_t n);`

Returns the length of a string, limited to n characters.
- `s` → string
- `n` → maximum length

---

19. `char *fm_strchr(const char *s, int c);`

Finds the first occurrence of character `c` in a string.
- `s` → string
- `c` → character

Returns a pointer to the first occurrence of `c` in `s`, or `NULL` if not found.

---

20. `char *fm_strrchr(const char *s, int c);`

Finds the last occurrence of character `c` in a string.
- `s` → string
- `c` → character

Returns a pointer to the last occurrence of `c` in `s`, or `NULL` if not found.

---

21. `int fm_strcmp(const char *a, const char *b);`

Compares two strings.
- `a`, `b` → strings

Returns:
- `0` if equal
- `< 0` if `a < b`
- `> 0` if `a > b`

---

22. `int fm_strncmp(const char *a, const char *b, size_t n);`

Compares up to `n` characters of two strings.
- `a`, `b` → strings
- `n` → max characters

Returns:

- `0` if equal
- `< 0` if `a < b`
- `> 0` if `a > b`

---

23. `char *fm_strcpy(char *dst, const char *src);`
 
Copies a null-terminated string from `src` to `dst`.

- `dst` → destination buffer
- `src` → source string

Returns a pointer to `dst`.

---

24. `char *fm_strncpy(char *dst, const char *src, size_t n);`

Copies up to `n` characters from `src` to `dst`.

- `dst` → destination buffer
- `src` → source string
- `n` → maximum number of characters

Returns a pointer to `dst`.

---

25. `char *fm_stpcpy(char *dst, const char *src);`

Copies a null-terminated string from `src` to `dst`.

- `dst` → destination buffer
- `src` → source string

Returns pointer to the null terminator in `dst`.

---

26. `size_t fm_strspn(const char *s, const char *accept);`

Counts how many characters from the beginning of `s` match characters in `accept`.

- `s` → string
- `accept` → characters to match

Returns the count.

---

27. `size_t fm_strcspn(const char *s, const char *reject);`

Counts characters from the start of `s` until a character from `reject` is found.

- `s` → string
- `reject` → characters not allowed

Returns the count.

---

28. `char *fm_strpbrk(const char *s, const char *accept);`

Finds the first occurrence in `s` of any character from `accept`.

- `s` → string
- `accept` → characters to search for

Returns a pointer to the first matching character, or `NULL` if none found.

---

29. `char *fm_strcat(char *dst, const char *src);`

Appends the string `src` to the end of `dst`.
- `dst` → destination string (must have enough space)
- `src` → source string
  
Returns the original pointer `dst`.

---

30. `char *fm_strncat(char *dst, const char *src, size_t n);`

Appends at most `n` characters from `src` to `dst`.
- `dst` → destination string (must have enough space)
- `src` → source string
- `n` → maximum number of characters to append
  
Returns the original pointer `dst`.

---

31. `char *fm_strstr(const char *haystack, const char *needle);`

Finds the first occurrence of the string `needle` in `haystack`.

- `haystack` → string to search in
- `needle` → substring to search for
  
Returns a pointer to the first occurrence, or `NULL` if not found.

---

32. `char *fm_strrev(char *s);`

Reverses the string `s` in place.

- `s` → string to reverse

Returns the original pointer `s`.

---

33. `size_t fm_strcount(const char *s, int c);`

Counts the number of occurrences of character `c` in the string `s`.

- `s` → input string
- `c` → character to count

Returns the number of occurrences.

---

34. `int fm_strcmp_i(const char *a, const char *b);`

Compares two strings case-insensitively.
- `a` → first string
- `b` → second string
  
Returns:
- `0` if equal
- `< 0` if `a < b`
- `> 0` if `a > b`

---

35. `int fm_strstartswith(const char *str, const char *prefix);`

Checks whether a string starts with a given prefix.
- `str` → input string
- `prefix` → prefix to test

Returns `1` if `str` starts with `prefix`, otherwise `0`.

---

36. `int fm_strendswith(const char *str, const char *suffix);`

Checks whether a string ends with a given suffix.
- `str` → input string
- `suffix` → suffix to test

Returns `1` if `str` ends with `suffix`, otherwise `0`.

---

37. `char *fm_strnchr(const char *s, int c, size_t n);`

Searches for the first occurrence of character `c` in string `s`, examining at most `n` bytes.
- `s` → pointer to the string
- `c` → character to search for
`n` → maximum number of bytes to scan

Stops early if a null terminator is encountered.

Returns a pointer to the matched character, or `NULL` if not found.

---

38. `char *fm_strnrev(char *s, size_t n);`

Reverses the first `n` characters of string `s` in place.
- `s` → pointer to the string
- `n` → number of characters to reverse
Characters beyond `n` remain unchanged.

Returns the original pointer `s`.

---

39. `int fm_strisalnum(const char *s);`

Checks whether the string `s` contains only alphanumeric characters.
- `s` → pointer to the string

Valid characters are `A–Z`, `a–z`, and `0–9`.
Returns `1` if all characters are alphanumeric or the string is empty, otherwise returns `0`.

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
  -lfastmem
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
  -lfastmem
```
**Important Notes**
- `-I` points to the directory containing `fastmem.h`
- `-L` points to the directory containing `libfastmem.a`
- `-lfastmem` links `libfastmem.a`
- The order matters: source files first, then `-lfastmem`

## License
This project is licensed under the MIT License
