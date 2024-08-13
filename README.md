# FALLBACK MUSIC PLAYER

The goal of this project is to create a reusuable install script for raspberry pi's that allows them to accept music streams and when the music stops, fall back to a soma radiostation. The idea in mind if for a gym where anyone can take over the sound system and when they leave there is still some background music.

## How it works
[Shairport-sync](https://github.com/mikebrady/shairport-sync) has two configuration methods for the start/stop of a playback session. When a session ends the background music starts a random radio station from [soma-fm](https://somafm.com/)

## How to add custom soma stations
- Create a file `/etc/soma-choices.csv`
- Each line needs to be a station name
<img width="116" alt="image" src="https://github.com/user-attachments/assets/0714a391-8d54-45df-b49f-65e1b271ced1">
 

## Todo
- [ ] Make work with [raspotify](https://github.com/dtcooper/raspotify)
- [ ] Get D-BUS working to pause shairport server to pause music when rasposity starts [see this issue](https://github.com/mikebrady/shairport-sync/issues/223)
