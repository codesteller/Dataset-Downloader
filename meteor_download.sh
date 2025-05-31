#!/bin/bash
# Download the meteor raw data from the specified URL
# Usage: ./download.sh <output_directory>
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <output_directory>"
    exit 1
fi
OUTPUT_DIR=$1

echo "Output directory: $OUTPUT_DIR"

download_chunks=("chunk_aa" "chunk_ab" "chunk_ac" "chunk_ad" "chunk_ae")

echo "Downloading chunks: ${download_chunks[@]}"


if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

# Download each chunk
for chunk in "${download_chunks[@]}"; do
    echo "Downloading $chunk..."
    wget "https://huggingface.co/datasets/XijunWang/METEOR/resolve/main/$chunk?download=true" -O "$OUTPUT_DIR/$chunk"
    if [ $? -ne 0 ]; then
        echo "Failed to download $chunk"
        exit 1
    fi
done

echo "All chunks downloaded successfully to $OUTPUT_DIR"
# Verify the download
for chunk in "${download_chunks[@]}"; do
    if [ ! -f "$OUTPUT_DIR/$chunk.json" ]; then
        echo "Error: $chunk not found in $OUTPUT_DIR"
        exit 1
    fi
done
echo "Verification complete. All files are present."

