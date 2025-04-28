# Get Description

[![GitHub Release](https://img.shields.io/github/v/release/ryohidaka/action-get-description)](https://github.com/ryohidaka/action-get-description/releases/)
[![Test Action](https://github.com/ryohidaka/action-get-description/actions/workflows/test.yml/badge.svg)](https://github.com/ryohidaka/action-get-description/actions/workflows/test.yml)

GitHub Actions to get repository description.

## Usage

```yml
on: [push]

jobs:
  get-description:
    runs-on: ubuntu-latest
    steps:
      - uses: ryohidaka/action-get-description@v0.1.0
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
```

## Inputs

| Input        | Description                               | Required | Default            |
| ------------ | ----------------------------------------- | -------- | ------------------ |
| `token`      | GitHub Token for API access               | ✅       |                    |
| `repository` | The repository in the format `owner/repo` |          | current repository |

## Outputs

| Output        | Description                       | Example                                         |
| ------------- | --------------------------------- | ----------------------------------------------- |
| `description` | The description of the repository | `GitHub Actions to get repository description.` |
