# encrypted-files

This is a simple example of storing encrypted files in source for use in CircleCI builds.

In this example, the gitignored contents of `secret-env-plain` are:

```
export FOO=secret
export BAR=alsosecret
```

If they are encrypted with `openssl aes-256-cbc -e -md sha256 -in secret-env-plain -out secret-env-cipher -k $KEY`, and `$KEY` is set
in the CircleCI project, the variables in `secret-env-plain` will be available in the build.

You could use the same process but replace the `openssl` command in `circle.yml` with `openssl aes-256-cbc -d -md sha256 -in secret-file-cipher -out secret-file-plain -k $KEY` to create plaintext files in the build environment instead of just exporting environment variables.
