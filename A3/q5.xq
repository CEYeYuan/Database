<!DOCTYPE html>
<html>
<body>
  <pre>&lt;popularity&gt;{
	for $playlist in doc(&quot;music.xml&quot;)//playlist
		let $lists:=doc(&quot;users.xml&quot;)//playlist[@pid=$playlist/@pid]
		let $low:=count($lists[@playcount&lt;5])
		let $medium:=count($lists[@playcount&gt;=5 and @playcount&lt;=49])
		let $high:=count($lists[@playcount&gt;=50])
		return &lt;histogram pid=&quot;{$playlist/@pid}&quot;&gt; 
			&lt;low	count=&quot;{$low}&quot;/&gt;
			&lt;medium count=&quot;{$medium}&quot; /&gt;
			&lt;high count=&quot;{$high}&quot; /&gt;
		   &lt;/histogram&gt;
}
&lt;/popularity&gt;
</pre>
</body>
</html>
