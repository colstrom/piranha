# piranha

fish functions for Amazon workflows

## Overview

`piranha` is an expressive DSL for describing your AWS infrastructure, and an intuitive framework for reducing complexity in your Cloud Operations.

# Description

Experimental workflow for managing AWS on the commandline.

# Setup

## Dependencies

These should be available in your `$PATH`. If you add additional dependencies, please indicate them in `dependencies.list`, which will be checked at startup.

### fish

Most of what makes this work is a pile of fish functions. Not having fish would make it awkward to use.

### awscli

Since the service we're using is AWS, having the AWS Command Line Interface is important.

### jq

The responses from Amazon's API tend to be blobs of JSON. jq is used by several functions to manipulate these blobs.

# Usage

Run `fish update.fish` to sync the configurations defined here with AWS.

## Debugging

Run fish, and add the `functions` directory to your `$fish_function_path`

```set fish_function_path /path/to/repository/functions $fish_function_path```

All functions under `functions` can be modified and executed trivially.

# Structure

## iam/*

IAM-related settings go here.

### IAM Users and Groups

A list of users is expected at `iam/user.list`, and a list of groups at `iam/group.list`. Any users or groups listed in these files will be created if they don't already exist.

### IAM Policies

Any JSON documents found under `iam/<user|group>/<username|groupname>/` will be assumed to be IAM polices of the corresponding type. These will be uploaded with a name matching the filename (without extension), and will overwrite any conflicting policies.

## s3/*

### S3 Buckets

A list of buckets is expected at `s3/bucket.list`. They will be created if they don't already exist.

# License
[MIT](https://tldrlegal.com/license/mit-license)

# Contributors
* [Chris Olstrom](https://colstrom.github.io/) | [e-mail](mailto:chris@olstrom.com) | [Twitter](https://twitter.com/ChrisOlstrom)

