#!/bin/bash -e

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source "$HOME/.cargo/env"

rustup target add wasm32-unknown-unknown

cargo install --locked trunk
cargo install cargo-edit
cargo install cargo-watch
cargo install cargo-generate

# cargo install cargo-binstall
