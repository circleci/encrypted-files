# encrypted-files

This is a simple example of storing encrypted files in source for use in CircleCI builds.

In this example, the gitignored contents of `secret-env-plain` are:

```
FOO=secret
BAR=alsosecret
```

If they are encrypted with `openssl aes-256-cbc -e -in secret-env-plain -out secret-env-cipher -k $KEY`, and `$KEY` is set
in the CircleCI project, the variables in `secret-env-plain` will be available in the build.
