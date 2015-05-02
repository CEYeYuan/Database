<!DOCTYPE html>
<html>
<body>
  <pre>&lt;fewfollowers&gt;{	
	for $user in doc(&quot;users.xml&quot;)//user
	let $follows:=doc(&quot;users.xml&quot;)//user[tokenize(follows/@who,&quot;\s+&quot;)=$user/@uid]
	return
		if (count($follows)=0)
			then (&lt;who uid='{$user/@uid}' /&gt;)
		else(
			if(count($follows)&lt;4)
				then  (&lt;who&gt; {$user/@uid}
					 {for $follow in $follows
					 return &lt;follower&gt; {$follow/@uid} &lt;/follower&gt;}
		  			 &lt;/who&gt;)
    			else ()
			)
	}	
&lt;/fewfollowers&gt;
</pre>
</body>
</html>
