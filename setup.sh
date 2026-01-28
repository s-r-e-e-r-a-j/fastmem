#!/usr/bin/env bash

set -e

if ! command -v nasm &>/dev/null; then
    if command -v apt &>/dev/null; then
        sudo apt update
        sudo apt install -y nasm
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y nasm
    elif command -v yum &>/dev/null; then
        sudo yum install -y nasm
    elif command -v pacman &>/dev/null; then
        sudo pacman -Sy --noconfirm nasm
    else
        echo "No supported package manager found. Install NASM manually."
        exit 1
    fi
fi

if ! command -v make &>/dev/null; then
    if command -v apt &>/dev/null; then
        sudo apt update
        sudo apt install -y build-essential
    elif command -v dnf &>/dev/null; then
        sudo dnf groupinstall -y "Development Tools"
    elif command -v yum &>/dev/null; then
        sudo yum groupinstall -y "Development Tools"
    elif command -v pacman &>/dev/null; then
        sudo pacman -Sy --noconfirm base-devel
    else
        echo "No supported package manager found. Install make manually."
        exit 1
    fi
fi

make
