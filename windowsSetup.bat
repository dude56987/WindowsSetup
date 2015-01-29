::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Windows Setup script for setting up a new windows system
:: Copyright (C) 2015  Carl J Smith
::
:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.
::
:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Install chocolatey package manager
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
echo Now setup basic sections
echo ###########################################
echo basic stuff
choco install firefox
choco install adblockplusfirefox 
choco install flashplayerplugin 
choco install clamwin
choco install 7zip
choco install MicrosoftSecurityEssentials
echo below package is broken for some reason
choco install InfraRecorder
choco install ChocolateyGUI 
choco install sumatrapdf
choco install transmission-qt
choco install unetbootin
echo communication
choco install thunderbird
choco install pidgin
choco install mumble
echo office and text tools
choco install scribus 
choco install libreoffice
choco install notepadplusplus
choco install meld
choco install freemind
echo Programming
choco install geany 
choco install orwelldevcpp 
echo video codecs and players
choco install mpc-hc
choco install ffdshow
choco install cccp
choco install xbmc
echo video tools
choco install win-youtube-dl 
choco install winff
choco install handbrake
choco install mediacoder 
choco install mediainfo 
echo system maintence tools
choco install bleachbit
choco install windirstat
choco install putty
choco install ultradefrag
echo graphic design
choco install gimp
choco install InkScape
choco install IcoFx 
echo sound editing
choco install audacity 
echo webdesign
choco install filezilla 
echo depends for other software
choco install python2
echo create a task to run updates daily on all packages
copy resources\scripts\updateAndUpgrade.bat C:\updateAndUpgrade.bat
schtasks /Create /F /RU SYSTEM /SC DAILY /TN Update_And_Upgrade_Choco_Packages /TR C:\updateAndUpgrade.bat /ST 03:00
echo setup custom hostsfile filter to block a lot of malware and ads
copy resources\configFiles\hosts C:\windows\system32\drivers\etc\hosts
echo pause for debug
PAUSE
