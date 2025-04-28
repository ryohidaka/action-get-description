#!/bin/bash

set -euo pipefail

# --- Constants ---
REPO="${1:-}"
TOKEN="${2:-}"
API_URL="https://api.github.com/repos/${REPO}"
RESPONSE_FILE="response.json"

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

# API Request
http_status=$(curl -sS -w "%{http_code}" -o "$RESPONSE_FILE" -H "Authorization: token $TOKEN" "$API_URL")

# Check HTTP Status
if [[ "$http_status" -ne 200 ]]; then
    error_exit "API request failed" "[ERROR] Failed to fetch repository '${REPO}'. HTTP status code: $http_status
$(cat "$RESPONSE_FILE")"
fi

# Extract Description
description=$(jq -r .description "$RESPONSE_FILE")

echo "::notice::Result: $description"

# Output to GitHub Actions
echo "description=$description" >>"$GITHUB_OUTPUT"

echo "::endgroup::"
