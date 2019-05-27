[![Build Status](https://dev.azure.com/ladisonline/homebrew-greetings/_apis/build/status/ladislas.homebrew-greetings?branchName=master)](https://dev.azure.com/ladisonline/homebrew-greetings/_build/latest?definitionId=5&branchName=master)

# Greetings, World!

## About

This tap's only purpose it to create a working example showing how to build bottles for taps.

## How do I install these formulae?

```shell
$ brew install ladislas/greetings/hello-world

# or

$ brew tap ladislas/greetings
$ brew install hello-world

```

## How to setup Azure Pipelines

> ⚠️ work in progress...

### Stages explained

`azure-pipelines.yml` contains different stages with different functions and different conditions. Some are dependent of others and will run sequentially, other won't.

#### Stage 1 - Testing formulae on `master`

This is the simplest stage that we have, and it does almost exactly the same things as what you would get after running [`brew tap new user/repo`](https://github.com/Homebrew/brew/blob/master/Library/Homebrew/dev-cmd/tap-new.rb).

- **Conditions**

	- it runs only on `master` events
	- when something new is pushed or merged

- **Depends on**

	- n/a

- **What it does**

	- it runs `brew test bot` on all the Formulae in `Formulae` Directory

#### Stage 2 - Cron job to test formulae

It's important to test formulae every once in a while to make sure they still work with their dependencies.

- **Conditions**

	- it runs on `master`
	- twice a day at 1am & 1pm

- **Depends on**

	- n/a

- **What it does**

	- it installs all formulae in `Formulae` directory
	- to run `brew test {formula} && brew linkage --test {formula}` on each formulae
	- if it fails, it creates a new branch
	- it `brew bump`s the failing formulae
	- and then creates a new *special PR* with [`hub`](https://github.com/github/hub)

#### Stage 3 - Building bottles on PR

This is one of the two most important stages and will build bottles on a new PR.

- **Conditions**

	- it runs on new pull requests
	- when they are created or modified

- **Depends on**

	- n/a

- **What it does**

	- it runs `brew test-bot --root-url` on modified and added formulae
	- to build bottles
	- for macOS Mojave (10.14) & macOS High Sierra (10.13)

#### Stage 4 - Uploading bottles to Bintray

This is the second most important stage of the pipeline. It takes the previously built bottles, upload them to Bintray and pushes the changes to a new `tag` on `master` for latter use.

- **Conditions**

	- it runs on new pull requests
	- when bottles have been built

- **Depends on**

	- Stage 3 - Building bottles on PR

- **What it does**

	- it runs `brew test-bot --ci-upload`
	- to upload bottles to Bintray
	- and creates a merge commit/tag that will be pushed to `origin/master`
	- you then need to run `brew pull --bottle` from your command line

#### Stage 5 - Auto publish revision bumps

When a formula needs to rebuild after failing the cron job, a *special PR* is created. This PR can and should be merge automatically without having a maintainer run `brew pull --bottles`. If your bottles are standalone and/or don't rely on libraries changing often, this stage is completely optional/unnecessary.

On the other hand, if your tap is for famous software with a lot of dependencies like `gcc`, `node`, `ffmpeg`, this step will make sure your users always have a working bottle to download. You might even want to add more cron scheduled jobs.

- **Conditions**

	- runs only for a *special PR*
	- when the bottles have been built and uploaded to Bintray

- **Depends on**

	- Stage 4 - Uploading bottles to Bintray

- **What it does**

	- it runs `brew pull --bottle` on the *special PR*
	- and pushes the merged changes to `master`

### Customize `azure-pipelines.yml`

You need to change the `# Github variables` and the `# Bintray variables` in `azure-pipelines.yml`.

### Create variable groups & upload secure file on Azure Pipelines

You need to create two Variable Groups to save logins, passwords and keys that will be used in the process:

- `bintray` variable group:
	- `bintray.user` - your Bintray username
	- `bintray.key` - your Bintray API key
- `ssh` variable group
	- `ssh.hostname` - hostname for github
	- `ssh.public_key` - the public key for github ssh connection
	- `ssh.secure_file` - the name of the secure file containing your private ssh key for github, i.e. `github_ssh_private_key`
	- `ssh.passphrase` - *optional* - the passphrase used to generate the ssh key

To generate the needed SSH keys/files, follow the [Connecting to GitHub with SSH instructions](https://help.github.com/en/articles/connecting-to-github-with-ssh)

You also need to add your SSH private key as a Secure File and give it the same name as `ssh.secure_file`. The key file can be found in `~/.ssh` with the name `id_rsa` (or whatever name you gave it).

### Setup Bintray

Your bottles will be uploaded on Bintray, so you need to:

- create an account (free for open source) and if needed a new organization (this is optional)
- create a new repository with the name `bottles-{your chosen name}` such as [`bottles-greetings`](https://bintray.com/ladislas/bottles-greetings)
- create a new package inside the repository with the name of the formula, such as `hello-world` or `goodbye-world`
- in `azure-pipelines.yml`, update `bintray_org` and `bintray_repo` variables

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
