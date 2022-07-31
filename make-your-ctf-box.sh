echo "make-your-own-ctf-box"
echo "PLEASE USE KALI LINUX FOR THIS SCRIPT"
echo "Are you sure you want to run this script? (y/n)"
read AYSYWTRTS
if [ $AYSYWTRTS = "y" ]; then
    echo "ARE YOU SURE YOU WANT TO RUN THIS SCRIPT? Type ABC12345 to continue."
    read PASS2
    if [ $PASS2 = "ABC12345" ]; then
        echo "Running Script..."
    else
        exit
    fi
else
    exit
fi

echo "[1] Updating Package Repos"
apt-get upgrade
apt upgrade

echo "[2] Installing Packages (apt-get)..."
apt-get install nmap
apt-get install docker
apt-get install python3
apt-get install samba
apt-get install git
apt-get install neovim
apt-get install nano
apt-get install wget gpg

echo "[2.1] Installing Packages (apt)..."
apt install powershell

echo "[3] Choose a text editor"
echo "1. VSCode     2. Sublime Text"

read TEXTEDITOR

if [ $TEXTEDITOR = "1" ]; then
    echo "Installing VSCode..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
else
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install apt-transport-https
    sudo apt-get install sublime-text
fi

echo "Done!"