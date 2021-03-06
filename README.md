# excoveralls_post_sample
[![Coverage Status](https://coveralls.io/repos/github/hirotnk/excoveralls_post_sample/badge.svg?branch=main)](https://coveralls.io/github/hirotnk/excoveralls_post_sample?branch=main)

This repository shows how [ExCoveralls](https://github.com/parroty/excoveralls)' `coveralls.post` options can be used in some cases.

## Problem 1: Line by line coverage does not show up
Paths to source files are different for each umbrella project, and detailed coverages for files do not show up on Coveralls UI. To solve this issue, you can use `--subdir <path>` and `--rootdir <path>` options.
![Path is broken](images/coveralls_missing_code_coverage.png)

## Problem 2: Want to use same build number for all umbrella projects coverage
We want to bundle all coverages for each umbrella project in a single build.

For example, we execute following mix coveralls.post under one umbrella project (for example, "umbrella1") with `--parallel true`:

`MIX_ENV=test mix coveralls.post --umbrella --token $TOKEN --build $BUILD_NUM --sha $GIT_COMMIT --parallel true --subdir "umbrella1/" --branch "master" --name "local host" --message $GIT_COMMIT_MSG`

Then we execute another mix coveralls.post under another umbrella project (for example, "umbrella2") with `--parallel true`:

`MIX_ENV=test mix coveralls.post --umbrella --token $TOKEN --build $BUILD_NUM --sha $GIT_COMMIT --parallel true --subdir "umbrella2/" --branch "master" --name "local host" --message $GIT_COMMIT_MSG`

Finally, we report the results with following:

`curl -k https://coveralls.io/webhook\?repo_token\=$TOKEN -d "payload[build_num]=$BUILD_NUM&payload[status]=done"`

We can use the same `$BUILD_NUM` for all umbrella projects using mix coveralls.post `--build <build_num>` option.
