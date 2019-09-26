#!/bin/bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak update
sudo flatpak install -y flathub io.dbeaver.DBeaverCommunity 
sudo flatpak install -y flathub com.visualstudio.code
sudo flatpak install -y flathub com.getpostman.Postman
sudo flatpak install -y flathub org.libreoffice.LibreOffice
sudo flatpak install -y flathub com.axosoft.GitKraken
