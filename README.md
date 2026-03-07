# P6's POSIX.2: p6df-1password

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

p6df module for 1Password: CLI tools (`op`, `1password-cli`), profile switching
(`OP_ACCOUNT`, `OP_EMAIL`, `OP_VAULT_NAME`), and MCP server support via op
plugins directory and `@takescake/1password-mcp` with `OP_SERVICE_ACCOUNT_TOKEN`.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### p6df-1password

##### p6df-1password/init.zsh

- `p6df::modules::1password::deps()`
- `p6df::modules::1password::external::brew()`
- `p6df::modules::1password::mcp()`
- `p6df::modules::1password::mcp::env()`
- `p6df::modules::1password::profile::off()`
- `p6df::modules::1password::profile::on(profile, account, vault_name)`
  - Args:
    - profile
    - account
    - vault_name
- `str str = p6df::modules::1password::prompt::mod()`

## Hierarchy

```text
.
├── init.zsh
└── README.md

1 directory, 2 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
