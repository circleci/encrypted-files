[![CircleCI](https://circleci.com/gh/muhammed-sayadi/circleci-encrypted-files.svg?style=svg)](https://circleci.com/gh/muhammed-sayadi/circleci-encrypted-files)

# circleci-encrypted-files

This is a simple example of storing encrypted files in source for use in CircleCI builds, updated to work with
version 2 of Circle.

In this example, the git-ignored contents of `env.plain` are:

```
FOO=secret1
BAR=secret2

```

Checking the build step `Access env vars in another script` on Circle, you can see that the variables were decrypted
and accessed correctly.

## How to Test Yourself

If you'd like to test this for your own project, here's a general step by step on how to re-produce this setup:

1- Fork this repository into your account.

2- Setup Circle project for your newly created repository.

3- In Circle's Project Settings, set the environment variable `CIRCLE_OPEN_SSL_PASSWORD` to a secured password.
Remember this value since you're going to use it later.

4- Clone the repository.

5- Set the same environment variable `CIRCLE_OPEN_SSL_PASSWORD` to the same value on your local machine.

6- Create a file called `env.plain` and enter the environment variables you want secured. For example, enter the
following:
```
FOO=secret3
BAR=secret4

```

7- Change directory to the circle directory; where the local encrypt and decrypt scripts are:
```
cd .circleci
```

8- Grant the local encrypt and decrypt scripts execution permissions:
```
chmod +x encrypt-local.sh
chmod +x decrypt-local.sh
```

9- Run the encryption script. This will update the `env.cipher` file with the encrypted values of your `env.plain`:
```
./encrypt-local.sh
``` 

10- To verify, locally, that decryption would work as expected, run the decrypt script:
```
./dcrypt-local.sh
```
This will generate a file called `env.generated`.

11- Check the content of the generated file; `env.generated`. This should match exactly with your `env.plain` content.

12- Open the `print-env-vars.sh` script, and update with your own variables. Please note that if you're forking this
public repository, you will end up with a public repository as well, so avoid testing with actual sensitive data.

If you're following with this example, there's no need to update anything.

13- Commit and push your changes. Note that the only file that would've changed is env.cipher. Note, also, that both
`.plain` and `.generated` extensions are ignored. If you change these, please make sure to update .gitignore as well.

```
# Make sure that only env.cipher is changed.
git status
```

```
# Assuming that you're still in .circleci directory
git add env.cipher
```

```
git commit -m "Updated env vars"
```

```
git push
```

14- Head to Circle's dashboard and check. If everything goes well, you should see your values at the end of the
`Access env vars in another script` step.

If you're following with this example, you should see the values we set in `env.plain`:
```
FOO: secret3 BAR: secret4
```
