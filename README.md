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
      - name: Run Get Description Action
        id: get_description
        uses: ryohidaka/action-get-description@v0.1.1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}

      - name: Show Description
        run: |
          echo "${{ steps.get_description.outputs.description }}"
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
