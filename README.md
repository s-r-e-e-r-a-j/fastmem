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


### String functions

`fm_strlen`

`fm_strnlen`

`fm_strchr`

`fm_strrchr`

`fm_strcmp`

`fm_strncmp`

---

## Architecture

- x86_64 (64-bit)
- Linux only

## Setup

**Clone the repository and navigate to the project directory:**

```bash
git clone https://github.com/s-r-e-e-r-a-j/fastmem.git
cd fastmem
```
A `setup.sh` script is provided to **check, install NASM, and build the library automatically**.

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
- Check whether NASM is installed
- Install NASM if it is missing
- Build the fastmem library

After completion, a `build` directory will be generated containing:
- Object files (`.o`)
- Static library (`libfastmem.a`)
