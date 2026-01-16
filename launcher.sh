#!/usr/bin/env bash

if [ ! -d "/var/data/lnp/" ]; then
  notify-send "Dwarf Fortress LNP is being extracted. Please wait..."
  mkdir -p /var/data/
  cd /var/data/
  cp /app/share/lnp/LinuxDwarfPack-0.47.05-r8.tar.bz2 .
  tar -xvf LinuxDwarfPack-0.47.05-r8.tar.bz2
  mv LinuxDwarfPack-0.47.05-r8/ lnp/
  rm LinuxDwarfPack-0.47.05-r8.tar.bz2
  cp /app/share/lnp/Vettlingr-1.6-1.zip .
  unzip Vettlingr-1.6-1.zip
  mv lnp/LNP/Graphics/Vettlingr/raw/onLoad_gfx_Vettlingr.init Vettlingr/raw/
  rm -rf lnp/LNP/Graphics/Vettlingr
  mv Vettlingr lnp/LNP/Graphics/
  rm -rf __MACOSX
  rm Vettlingr-1.6-1.zip
  
  # set up symlinks for dwarf fortress.
  # it looks like it loads it manually so LD_PRELOAD doesn't seem to work...
  cd /var/data/lnp/df_47_05_linux/
  ln -s /app/lib/libSDL-1.2.so.0 libSDL-1.2.so.0
  ln -s /app/lib/libgtk-x11-2.0.so.0 libgtk-x11-2.0.so.0
  ln -s /app/lib/libSDL_image-1.2.so.0 libSDL_image-1.2.so.0
  ln -s /app/lib/libGLU.so.1 libGLU.so.1
  ln -s /app/lib/libSDL_ttf-2.0.so.0 libSDL_ttf-2.0.so.0
  # copy user config
  cp /app/share/lnp/PyLNP.user /var/data/lnp/
fi

cd /var/data/lnp/
./startlnp.sh
