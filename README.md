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

---

2. `void *fm_memmove(void *dst, const void *src, size_t n);`

Copies `n` bytes from `src` to `dst`, safely handling overlapping regions.

- `dst` → destination buffer
- `src` → source buffer
- `n` → number of bytes to copy

Safe replacement for `memcpy` when overlap is possible.

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

Returns pointer to the byte or `NULL.`

---

7. `void *fm_memrchr(const void *s, int c, size_t n);`

Searches for the last occurrence of byte `c` in memory.
- `s` → memory block
- `c` → byte to search
- `n` → number of bytes

Returns pointer or `NULL.`

---

8. `size_t fm_strlen(const char *s);`

Returns the length of a null-terminated string.
- `s` → string

Does not include the null terminator.

---

9. `size_t fm_strnlen(const char *s, size_t n);`

Returns the length of a string, limited to n characters.
- `s` → string
- `n` → maximum length

---

10. `char *fm_strchr(const char *s, int c);`

Finds the first occurrence of character `c` in a string.
- `s` → string
- `c` → character

Returns pointer or NULL.

---

11. `char *fm_strrchr(const char *s, int c);`

Finds the last occurrence of character `c` in a string.
- `s` → string
- `c` → character

---

12. `int fm_strcmp(const char *a, const char *b);`

Compares two strings.
- `a`, `b` → strings

Returns:
- `0` if equal
- `< 0` if `a < b`
- `> 0` if `a > b`

---

13. `int fm_strncmp(const char *a, const char *b, size_t n);`

Compares up to `n` characters of two strings.
- `a`, `b` → strings
- `n` → max characters

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
