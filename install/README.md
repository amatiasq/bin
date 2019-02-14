# Automatic configuration for new computers

This scripts will configure the system to my preference and install my favorites applications.
During the process you'll be asked to add the given SSH key to your Github configuration in order to clone the repositories.

[Repositories to be cloned](./repos.txt)

## Usage

Download [`install.sh`](https://raw.githubusercontent.com/amatiasq/bin/master/install/install.sh) and execute it from the terminal/powershell.
This will detect your system and execute the corresponding scripts.

From Unix (and Windows' bash) systems you can do this with a single command:

```bash
curl https://raw.githubusercontent.com/amatiasq/bin/master/install/install.sh | bash
```

## System specific documentation

### GNU/Linux

Developed for Ubuntu.

```bash
curl https://raw.githubusercontent.com/amatiasq/bin/master/install/linux/init.sh | bash
```

This will clone the `bin` repository in `/tmp` so it can execute the rest of the scripts.
This is done in `/tmp` because the repository is cloned with HTTPS, without SSH key needed.

Some installed packages:

- NVIDIA Drivers
- NVM (with NodeJS stable)
- snap package manager

[Applications to be installed](./linux/applications)

### MacOS

```bash
curl https://raw.githubusercontent.com/amatiasq/bin/master/install/mac/init.sh | bash
```

This will clone `bin` in `~/bin`. This will require SSH key configuration.

This will also configure `dotfiles` a syncrhonization tool for system's and application's configuration files.

Some installed packages:

- Homebrew (with cask)
- NVM (with NodeJS stable)

[Applications to be installed](./mac/applications.sh)

### Windows

```bash
bash -e 'curl https://raw.githubusercontent.com/amatiasq/bin/master/install/windows/init.ps1 | powershell'
```

Three scripts can be found here:

- [`init.ps1`](./windows/init.ps1) that runs `chocolately.ps1` and `packages.ps1`
- [`chocolately.ps1`](./windows/chocolately.ps1) to install chocolately package manager
- [`packages.ps1`](./windows/packages.ps1) with a list a packages to be installed with chocolately
- [`packages-single-command.ps1`](./windows/packages-single-command.ps1) the same as `packages.ps1` but in a single command if you are lazy

There is a generator script (bash of course, what did you expect?) to generate `packages-single-command.ps1` from `packages.ps1`.

The rest is up to you, you deserve that for using Windows :)
