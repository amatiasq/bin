# Run powershell as administrator and run:
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Then in another terminal execute this:
choco install googlechrome
choco install firefox
choco install spotify
choco install slack
choco install steam

# choco install clipclip -- not part of chocolatey packages
choco install greenshot
choco install nodejs
choco install docker-desktop

choco install vscode
choco install sublimetext3
choco install notepadplusplus
choco install gitkraken
choco install visualstudio2017community

choco install octave
choco install blender
choco install magicavoxelviewer
