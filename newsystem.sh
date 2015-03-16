SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update configs
sudo sed -i "s/ca.archive.ubuntu.com/mirror.its.dal.ca/g" /etc/apt/sources.list #Switch to dal sources mirror

# Remove things I don't need
sudo apt-get remove -y \
  software-center \
  firefox \
  thunderbird \
  gmusicbrowser \
  abiword \
  gnumeric \
  pidgin \
  gimp \
  transmission-gtk \
  transmission-common \
  parole \
  xfburn \
  vim-tiny

# Clean up
sudo apt-get autoremove -y

# Install chrome PPA
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'

# Update packages
sudo apt-get update -y
sudo apt-get dist-upgrade -y

# Install packages
sudo apt-get install -y \
  build-essential \
  python-dev \
  cmake \
  texlive \
  latexmk \
  graphviz \
  vim \
  gnome-system-monitor \
  openssh-server \
  ack-grep \
  tree \
  python3-pip \
  baobab \
  google-chrome-stable

# Speed up user interface
cat <<EOT > ~/.gtkrc-2.0
gtk-menu-popup-delay = 0 
gtk-menu-popdown-delay = 0 
gtk-menu-bar-popup-delay = 0 
gtk-enable-animations = 0 
gtk-timeout-expand = 0
gtk-timeout-initial = 0
gtk-timeout-repeat = 0
EOT

# Change keyboard layout
DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true sudo debconf-set-selections $SCRIPT_DIR/preseed.txt

$SCRIPT_DIR/setup_dotfiles.sh $SCRIPT_DIR

# Update keyboard shortcuts
xfconf-query \
  --channel xfce4-keyboard-shortcuts \
  --property "/commands/custom/<Super>space" \
  --create \
  --type string \
  --set "xfce4-popup-whiskermenu"

xfconf-query \
  --channel xfce4-keyboard-shortcuts \
  --property "/xfwm4/custom/<Super>Left" \
  --create \
  --type string \
  --set "tile_left_key"

xfconf-query \
  --channel xfce4-keyboard-shortcuts \
  --property "/xfwm4/custom/<Super>Right" \
  --create \
  --type string \
  --set "tile_right_key"

# Disable screen locking
sed -i "s/^Exec=.*$/Exec=/g" ~/.config/autostart/light-locker.desktop #Disable light-locker

# Disable apport
sudo sed -i "s/enabled=1/enabled=0/g" /etc/default/apport

# Disable swap
sudo sysctl -w vm.swappiness=0
sudo echo "vm.swappiness = 0" | sudo tee -a /etc/sysctl.conf >> /dev/null

printf 'TODO: Install guest additions\n'

