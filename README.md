Wercker step chefdk [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/poppen/wercker-step-chefdk/blob/master/LICENCE)
====

[![wercker status](https://app.wercker.com/status/1df9d9e63b281bbb63017a1c68844c87/m/master "wercker status")](https://app.wercker.com/project/bykey/1df9d9e63b281bbb63017a1c68844c87)

This is [wercker](http://wercker.com/) step for installing [Chef Development Kit](https://downloads.chef.io/chef-dk/).

## Usage

In the `wercker.yml` of your application use the following step definition:

```yaml
steps:
  - poppen/chefdk:
      version: 0.4.0
```

## Options

- `version` (optional) Specify the version of Chef Development Kit. If left empty, version 0.4.0 will be installed.

## Requirements

If you use wercker-box which is not installed `wget`, you need additional step:

```yaml
steps:
  - script:
      name: install wget
      code: |
        sudo apt-get update -y
        sudo apt-get install -y wget
  - poppen/chefdk
```

## Author

[poppen](https://github.com/poppen)
