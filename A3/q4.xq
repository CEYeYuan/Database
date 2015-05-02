<!DOCTYPE html>
<html>
<body>
  <pre>&lt;pairs&gt;	
{
	for $user1 in doc(&quot;users.xml&quot;)//user
	for $user2 in doc(&quot;users.xml&quot;)//user[@uid&gt;$user1/@uid]

	let $playlist1:=$user1//playlist/@pid
	let $playlist2:=$user2//playlist/@pid
	
	return if (every $p1 in $playlist1 satisfies $p1=$playlist2 and
			   every $p2 in $playlist2 satisfies $p2=$playlist1 and
			   count($playlist1)&gt;=5)

			   then ( &lt;pair uid1=&quot;{data($user1/@uid)}&quot; uid2=&quot;{data($user2/@uid)}&quot;/&gt;)
			else()
}
&lt;/pairs&gt;
</pre>
</body>
</html>
