[![Build Status](https://dev.azure.com/ladisonline/homebrew-hello-world/_apis/build/status/ladislas.homebrew-hello-world?branchName=master)](https://dev.azure.com/ladisonline/homebrew-hello-world/_build/latest?definitionId=3&branchName=master)

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
- create a new repository with the name `bottles-{your chosen name}` such as `bottles-greetings`
- create a new package inside the repository with the name of the formula, such as `hello-world` or `goodbye-world`
- in `azure-pipelines.yml`, update `bintray_org` and `bintray_repo` variables

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
