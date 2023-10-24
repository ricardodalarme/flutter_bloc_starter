# Contributing

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Default Branch](#default-branch)
- [Commits](#commits)
  - [Structure](#structure)
    - [Header](#header)
      - [Type](#type)
      - [Scope](#scope)
      - [Description](#description)
    - [Body](#body)
    - [Footer](#footer)
  - [Examples](#examples)
- [Pull Requests](#pull-requests)
- [Code Guidelines](#code-guidelines)

## Default Branch

The default branch of this repository is `master`.

## Commits

Commits should follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) format. Add any relevant issue numbers to the bottom of the commit. (e.g. Closes #1)

Each commit message consists of a **header**, an optional **body** and an optional **footer**. The header has a special format that includes a **type**, an optional **scope** and a **subject**:

### Structure

```
<type>[optional scope]: <description>

[optional body]

[footer(s)]
```

#### Header

- The header is mandatory and the scope of the header is optional.
- Avoid committing lines longer than 100 characters: this allows the message to be easier to read on git tools

##### Type

Valid types are:

- **feat:** A new feature
- **fix:** A bug fix
- **docs:** Documentation only changes
- **style:** Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor:** A code change that neither fixes a bug nor adds a feature
- **perf:** A code change that improves performance
- **test:** Adding missing or correcting existing tests
- **chore:** Changes to the build process or auxiliary tools and libraries such as documentation generation
- **ci:** Reserved to CI bot commits

##### Scope

The scope may represent anything impacted by the commit (e.g. a component, an epic). If it makes the message more helpful, use it.

##### Description

The description contains a succinct overview of the change:

- Use the imperative, present tense: "change" not "changed" nor "changes"
- Don't capitalize the first letter
  - There is a linting rule preventing this
- No period (.) at the end

#### Body

Use your best judgment to format the body, keeping it helpful and tidy, using the same rules from the subject above.

Write one or more lines as bullet points, for instance:

```
* do this
* do that
```

#### Footer

List the related GH issues in a single line (separated by spaces if multiple issues are affected), see examples below.

### Examples

```
chore(documentation): add basic documentation

* add pull request template
* add ADR section and folder structure
* add table of contents and relevant sections

Closes #1 #2
```

## Pull Requests

- Pull requests will follow the [PR Template](./github/PULL_REQUEST_TEMPLATE.md).
- Pull requests require 2 approvals prior to merging.
- Pull requests do not require a ticket number in the title.
- A number of `Github Actions` will be run against every PR opened against `master`. These actions will run tests, check types, and lint the codebase to offer a base level check of code quality.

## Code Guidelines

More details on [Code Guidelines](./docs/CODE-GUIDELINES.md).
