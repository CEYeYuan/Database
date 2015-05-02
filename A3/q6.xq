<!DOCTYPE html>
<html>
<body>
  <pre>&lt;songcounts&gt;{
	for $song in doc(&quot;music.xml&quot;)//song
		let $playlists:= doc(&quot;music.xml&quot;)//playlist[track/@sid=$song/@sid]
		let $playcount:=doc(&quot;users.xml&quot;)//playlist[@pid=$playlists/@pid]/@playcount
		let $sumOfplaycount:=sum($playcount)
	return &lt;song sid=&quot;{$song/@sid}&quot; title=&quot;{$song/title}&quot; 
	playcount=&quot;{$sumOfplaycount}&quot; /&gt;
}
&lt;/songcounts&gt;</pre>
</body>
</html>
