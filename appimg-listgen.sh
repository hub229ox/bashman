#!/bin/bash
# Title: spm
# Description: Downloads and installs AppImages and precompiled tar archives.  Can also upgrade and remove installed packages.
# Dependencies: GNU coreutils, tar, wget, python3.x
# Author: simonizor
# Website: http://www.simonizor.gq
# License: GPL v2.0 only
# Generate two separate lists from cloned appimagehub github repo's data folder

# Generate list of github AppImages with versions that can be managed
for image in $(dir -C -w 1 /home/$USER/github/appimage.github.io/data); do
    URL="$(grep -v '#' /home/$USER/github/appimage.github.io/data/"$image" | grep '.*github*.' | cut -f-5 -d"/")"
    if [ ! -z "$URL" ]; then
        case $URL in
            *api.github*)
                REPO="$(echo $URL | cut -f5,6 -d"/")"
                URL="https://github.com/$REPO"
                ;;
            *)
                REPO="$(echo $URL | cut -f4,5 -d"/")"
                ;;
        esac
        lower_image="$(echo "$image" | tr '[:upper:]' '[:lower:]')"
        echo "$lower_image:"
        echo "    name: $image"
        echo "    url: $URL/releases"
        echo "    apiurl: https://api.github.com/repos/$REPO/releases"
    fi
done > /home/$USER/github/spm/AppImages-github.yaml
# Fix/remove broken links and add any AppImages that appimagehub misses
sed -i '0,/sharexin/s%sharexin:%%g;0,/    name: sharexin/s%    name: sharexin%%g;0,/    url: https*..*ShareXin*..*releases/s%    url: https*..*ShareXin*..*releases%%g;0,/    apiurl: https*..*ShareXin*..*releases/s%    apiurl: https*..*ShareXin*..*releases%%g' /home/$USER/github/spm/AppImages-github.yaml # Remove duplicate
sed -i 's%https://github.com/nteract/releases%https://github.com/nteract/nteract/releases%g;s%https://api.github.com/repos/nteract/releases%https://api.github.com/repos/nteract/nteract/releases%g' /home/$USER/github/spm/AppImages-github.yaml # Fix broken link
sed -i 's%    url: https://github.com/darealshinji/releases%    url: https://github.com/darealshinji/vlc-AppImage/releases%g;s%    apiurl: https://api.github.com/repos/darealshinji/releases%    apiurl: https://api.github.com/repos/darealshinji/vlc-AppImage/releases%g' /home/$USER/github/spm/AppImages-github.yaml # Fix broken link
sed -i 's%    url: https://github.com/ozmartian/releases%    url: https://github.com/ozmartian/vidcutter/releases%g;s%    apiurl: https://api.github.com/repos/ozmartian/releases%    apiurl: https://api.github.com/repos/ozmartian/vidcutter/releases%g' /home/$USER/github/spm/AppImages-github.yaml # Fix broken link
sed -i '/^$/d' /home/$USER/github/spm/AppImages-github.yaml # Remove blank lines
sed -i 's%neovim:%nvim:%g;s%: neovim%: nvim%g' /home/$USER/github/spm/AppImages-github.yaml # change neovim to name to be the same as neovim's exectuable name is normally
echo "discord-stable:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: discord-stable" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "discord-ptb:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: discord-ptb" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "discord-canary:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: discord-canary" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "discord-toolbox:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: DiscordToolbox" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/simoniz0r/DiscordToolbox/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/simoniz0r/DiscordToolbox/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "inxi:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: inxi" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "neofetch:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: neofetch" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/simoniz0r/AppImages/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "todo:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: todo" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/simoniz0r/todo/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/simoniz0r/todo/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "tc-linux:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: tc-linux" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/mccxiv/tc" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/mccxiv/tc/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "vterm:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: vterm" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/vterm/vterm/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/vterm/vterm/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "xdgfetch:" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    name: xdgfetch" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    url: https://github.com/simoniz0r/xdgfetch/releases" >> /home/$USER/github/spm/AppImages-github.yaml
echo "    apiurl: https://api.github.com/repos/simoniz0r/xdgfetch/releases" >> /home/$USER/github/spm/AppImages-github.yaml

# Generate a list of AppImages from sites other than github with versions that cannot be managed
for image in $(dir -C -w 1 /home/$USER/github/appimage.github.io/data); do
    URL="$(grep -v '#' /home/$USER/github/appimage.github.io/data/"$image" | grep -v '.*github*.')"
    if [ ! -z "$URL" ]; then
        lower_image="$(echo "$image" | tr '[:upper:]' '[:lower:]')"
        echo "$lower_image:"
        echo "    name: $image"
        echo "    url: $URL"
    fi
done > /home/$USER/github/spm/AppImages-direct.yaml
sed -i 's%    url: http://libreoffice.soluzioniopen.com/daily/LibreOfficeDev-6.0.0.0.alpha0_2017-08-18-x86_64.AppImage%    url: http://libreoffice.soluzioniopen.com/daily/LibreOfficeDev-6.0.0-x86_64.AppImage%g' /home/$USER/github/spm/AppImages-direct.yaml # Fix broken link
sed -i 's%    url: https://download.kde.org/stable/krita/3.1.4/krita-3.1.4-x86_64.appimage%    url: https://download.kde.org/stable/krita/3.2.1/krita-3.2.1-x86_64.appimage%g' /home/$USER/github/spm/AppImages-direct.yaml # Update to latest version
sed -i 's%    url: https://download.kde.org/stable/kdevelop/5.1.1/bin/linux/KDevelop-5.1.1-x86_64.AppImage%    url: http://kfunk.ddns.net:8080/job/kdevelop-appimage-centos/lastSuccessfulBuild/artifact/KDevelop-git-x86_64.AppImage%g' /home/$USER/github/spm/AppImages-direct.yaml # Change to git version to avoid maintaining latest version link
sed -i 's%    url: https://download.kde.org/stable/kdenlive/16.12/linux/Kdenlive-16.12-x86_64.AppImage%    url: http://files.kde.org/kdenlive/release/Kdenlive-17.04.1b-x86_64.AppImage%g' /home/$USER/github/spm/AppImages-direct.yaml # Update to latest version
sed -i 's%wastesedge:%%g;s%    name: wastesedge%%g;s%    url: http://download.savannah.gnu.org/releases/adonthell/wastesedge-0.3.6-x86_64-linux.tar.gz%%g' /home/$USER/github/spm/AppImages-direct.yaml # Remove this; not going to support AppImages in tar archives
sed -i '/^$/d' /home/$USER/github/spm/AppImages-direct.yaml # Remove blank lines
