# couchbase

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What couchbase affects](#what-couchbase-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with couchbase](#beginning-with-couchbase)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

A one-maybe-two sentence summary of what the module does/what problem it solves.
This is your 30 second elevator pitch for your module. Consider including
OS/Puppet version it works with.

## Module Description

If applicable, this section should have a brief description of the technology
the module integrates with and what that integration enables. This section
should answer the questions: "What does this module *do*?" and "Why would I use
it?"

If your module has a range of functionality (installation, configuration,
management, etc.) this is the time to mention it.

## Setup

### What couchbase affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

### Beginning with couchbase

basic couchbase setup:

```puppet
class { 'couchbase':
  version => '3.0.3',
}

couchbase::backupscript { 'backups':
  destination => '/backup',
}

class { 'couchbase::monitscripts': }
```

## Usage

TODO

## Reference

TODO

## Limitations

Tested on Ubuntu 14.04

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature
