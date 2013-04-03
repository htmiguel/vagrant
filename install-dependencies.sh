#!/bin/bash

####################################################################
###THIS SCRIPT INSTALLS ALL DRIP DEPENDENCIES ON AN UBUNTU SYSTEM###
###MUST BE RUN AS ROOT##############################################
####################################################################


###MAKE SURE THE CURRENT USER IS ROOT###
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


###INSTALL PHP MODULES###

apt-get install -y php5-cli php5-curl php5-sqlite;



###INSTALL AUDIO METADATA APPLICATIONS###

apt-get install -y vorbis-tools flac eyed3 mp4v2-utils

#INSTALL eyeD3 PATCH
cp ../includes/scripts/metadata/eyeD3 /usr/bin/eyeD3

###INSTALL IMAGE APPLICATIONS###

apt-get install -y imagemagick;


###BUILD AND INSTALL SOX WITH MP3 SUPPORT###

apt-get install -y build-essential fakeroot dpkg-dev devscripts;
apt-get -y build-dep sox;
apt-get -y install libmp3lame-dev;
cd ~ && mkdir build && cd build;
apt-get source -y sox;
cd sox-*;
sed -i 's/--without-lame //' debian/rules;
sed -i 's/libmagic-dev, /libmagic-dev, libmp3lame-dev, /' debian/control;
sed -i 's/Write support not available yet.//' debian/control;
fakeroot debian/rules binary;
sudo dpkg -i ../*.deb;
fakeroot debian/rules clean;
cd ~ && rm -drf build/;


###AVCONV###

apt-get install -y yasm;

###ADD A SYMLINK TO THE METADATA SCRIPT IN /usr/bin###

cd ..;
wd=`pwd;`;
cd /usr/bin;
ln -s "$wd/includes/scripts/metadata/metadata.sh" metadata;


###INSTALLATION IS NOW COMPLETE###

echo "DRIP DEPENDENCY INSTALLATION COMPLETE.";
