<!DOCTYPE html>
<html>
<body>
  <pre>&lt;noplaylist&gt;{
	let $songs:=doc(&quot;music.xml&quot;)//track/@sid
	for $song in doc(&quot;music.xml&quot;)//song 
	return 
		if ($song/@sid = $songs) 
		then ()
		else (&lt;song&gt; {$song/@sid} &lt;/song&gt;)
}&lt;/noplaylist&gt;
</pre>
</body>
</html>
