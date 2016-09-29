songs=$1
if [ "$songs" == "" ] ; then
	echo "Usage: ./youtubeGetter [FILE / STRING]"
	exit
else
	if [ -f $songs ]; then
		if ! [ -f links.txt ]; then
			touch links.txt
			while read p; do
				echo "--------------------------"
				echo "Searching for $p..."
				a=$(googler $p youtube -C --np | sed -n 2p)
				if [ "$a" == "No results." ] || [ "$a" == "" ] ; then
					echo "No results found for $p!"
				else
					echo "Found: $a"
					echo $a >> links.txt
				fi
			done < $songs
		fi

		if [ ! -d ./mp3 ]; then
			mkdir ./mp3
		fi

		while read p; do
			youtube-dl --extract-audio --audio-format mp3 -f bestvideo+bestaudio $p -o './mp3/%(title)s.%(ext)s' &
		done < links.txt
		rm links.txt
	else
		echo "Searching for $songs..."
				a=$(googler $songs youtube -C --np  | sed -n 2p)
				if [ "$a" != "No results." ] && [ "$a" != "" ] ; then
					echo "Found: $a"
					youtube-dl --extract-audio --audio-format mp3 -f bestvideo+bestaudio $a -o './%(title)s.%(ext)s' 
				fi
			fi
fi