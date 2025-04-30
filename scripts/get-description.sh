#!/bin/bash

set -euo pipefail

# --- Constants ---
REPO="${1:-}"
TOKEN="${2:-}"
API_URL="https://api.github.com/repos/${REPO}"

# --- Functions ---
error_exit() {
    echo "::error title=$1::$2" >&2
    exit 1
}

# --- Main ---
echo "::group::Get Repository Description"

# Validate arguments
if [[ -z "$REPO" && -z "$TOKEN" ]]; then
    error_exit "Invalid arguments" "[ERROR] Usage: $0 <repository> <token> - Both repository and token are missing."
elif [[ -z "$REPO" ]]; then
    error_exit "Missing repository" "[ERROR] Usage: $0 <repository> <token> - Repository argument is missing."
elif [[ -z "$TOKEN" ]]; then
    error_exit "Missing token" "[ERROR] Usage: $0 <repository> <token> - Token argument is missing."
fi

# API Request and extract description
response=$(curl -sS -H "Authorization: token $TOKEN" -w "\n%{http_code}" "$API_URL")
http_status=$(echo "$response" | tail -n1)
body=$(echo "$response" | sed '$d')

# Check HTTP Status
if [[ "$http_status" -ne 200 ]]; then
    error_exit "API request failed" "[ERROR] Failed to fetch repository '${REPO}'. HTTP status code: $http_status
$body"
fi

# Extract Description
description=$(echo "$body" | jq -r .description)

echo "::notice::Result: $description"

# Output to GitHub Actions
echo "description=$description" >>"$GITHUB_OUTPUT"

echo "::endgroup::"
