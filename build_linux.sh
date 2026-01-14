#!/bin/bash

player_link="https://github.com/Minxrod/Partial-SSEQ-Player"

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
player_dir="${project_dir}/external/sseq"
lib_dir="${project_dir}/lib"
build_dir="${project_dir}/build"
res_dir="${project_dir}/resources"

extractor_file="${res_dir}/nds_extract"
archive_file="${res_dir}/rom.nds"
player_file="${player_dir}/libSSEQPlayer.so"

mkdir -p "$player_dir" "$lib_dir" "$build_dir" && \
git clone "$player_link" "$player_dir" && \
make -C "$player_dir" lib && \
mv "$player_file" "${lib_dir}/" && \
make -C "$project_dir" && \
cd "$res_dir" && \
"$extractor_file" "$archive_file"