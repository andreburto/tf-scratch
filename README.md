# tf-scratch

## About

An experimental project where I can try out [Terraform](https://www.terraform.io/) ideas separate from actual projects.
A lot of this work is done within a Windows environment.
Aside from [PowerShell](https://docs.microsoft.com/en-us/powershell/) is all should work on any environment where Terraform does.

## Requirements

Notes to my self about what is required to be installed.

### Environment

An `.env` file is required using the following skeleton:
```
AWS_ACCESS_KEY_ID=
AWS_DEFAULT_REGION=
AWS_SECRET_ACCESS_KEY=
DOCKER_PASSWORD=
DOCKER_USERNAME=
```

There is a `static` directory in the root of the project that is excluded via `.gitignore` as the files there are not relevant.

### Terraform

Currently using `v1.2.4`.

### Docker

Currently using `20.10.14` for Windows.

### PowerShell

Currently using version `5.1.19041.1682`.

Installed [AWS Tools for PowerShell](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up.html).

## To Do

1. Setup script to install requirements.
2. Setup Terraform script to manage Github repo (maybe).
