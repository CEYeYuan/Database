<!DOCTYPE html>
<html>
<body>
  <pre>&lt;favourites&gt;
{
	for $user in doc(&quot;users.xml&quot;)//user
	let $count:=count($user//playlists)
	return 	if ($count=0) 
			then ( &lt;user&gt; {$user/@uid} &lt;/user&gt;)
			else(
				let $playlist:=doc(&quot;users.xml&quot;)//user[@uid=$user/@uid]//playlist
				let $max:=max($playlist/@playcount)
				let $maxlists:=doc(&quot;users.xml&quot;)//user[@uid=$user/@uid]//playlist[@playcount=$max]
				for $maxplaylist in $maxlists 
				return &lt;user uid=&quot;{$user/@uid}&quot; pid=&quot;{$maxplaylist/@pid}&quot; playcount=&quot;{$max}&quot; /&gt;		
			)	
}			
&lt;/favourites&gt;</pre>
</body>
</html>
