# youtubeDownloader  
#### A simple Bash script for downloading music.  
youtubeDownloader is a Bash script that downloads music.  

 -----------  
**What do I need?**  
You will need [youtube-dl](https://github.com/rg3/youtube-dl) and [googler](https://github.com/jarun/googler) installed.

------------
**Usage**  
./youtubeDownloader [FILE / STRING]  
When passing a file to it, it will search and download all the entries in the file.  
When passing a string, it will just search for that entry.  
------------
**How does it work?**  
1) Search for what you prompt on Google
2) Get the URL from the first result
3) Pass the found URL to youtube-dl
4) Download and convert
5) Done!
