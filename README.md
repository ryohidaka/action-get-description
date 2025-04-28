# Get Description

[![GitHub Release](https://img.shields.io/github/v/release/ryohidaka/action-get-description)](https://github.com/ryohidaka/action-get-description/releases/)
[![Test Action](https://github.com/ryohidaka/action-get-description/actions/workflows/test.yml/badge.svg)](https://github.com/ryohidaka/action-get-description/actions/workflows/test.yml)

GitHub Actions to get repository description.

## Usage

```yml
on: [push]

permissions:
  contents: write

jobs:
  get-description:
    runs-on: ubuntu-latest
    steps:
      - uses: ryohidaka/action-get-description@v1
        with:
          who-to-greet: "Mona the Octocat"

      - run: echo random-number "$RANDOM_NUMBER"
        shell: bash
        env:
          RANDOM_NUMBER: ${{ steps.foo.outputs.random-number }}
```

## Inputs

| Input          | Description  | Required | Default |
| -------------- | ------------ | -------- | ------- |
| `who-to-greet` | Who to greet | ✅       | `World` |

## Outputs

| Output          | Description   | Example |
| --------------- | ------------- | ------- |
| `random-number` | Random number | `9999`  |
