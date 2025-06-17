#!/bin/bash

# URL to scrape
URL="https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops"

# Fetch HTML content
HTML=$(curl -s "$URL")

# Extract titles
titles=($(echo "$HTML" | grep -oP '(?<=<a class="title" href="[^"]+">)[^<]+' | sed 's/|//g'))

# Extract descriptions
descriptions=($(echo "$HTML" | grep -oP '(?<=<p class="description">)[^<]+' | sed 's/|//g'))

# Extract prices
prices=($(echo "$HTML" | grep -oP '(?<=<h4 class="pull-right price">)[^<]+'))

# Print result
count=${#titles[@]}
for ((i=0; i<$count; i++)); do
  echo "${titles[$i]} | ${descriptions[$i]} | ${prices[$i]}"
done
