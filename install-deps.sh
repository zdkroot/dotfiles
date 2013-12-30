# up to you (me) if you want to run this as a file or copy paste at your leisure

# homebrew!
# you need the code CLI tools YOU FOOL
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# https://github.com/rupa/z
# z, oh how i love you
mkdir ~/bin && cd ~/bin
git clone https://github.com/rupa/z.git
chmod +x ~/bin/z/z.sh
# also consider moving over your current .z file if possible. it's painful to rebuild :)

# https://github.com/dronir/SpotifyControl
# Spotify Controll Script
cd ~/bin
git clone git://github.com/dronir/SpotifyControl.git

# https://github.com/jeroenbegyn/VLCControl
# VLC Controll Script
cd ~/bin
git clone git://github.com/jeroenbegyn/VLCControl.git