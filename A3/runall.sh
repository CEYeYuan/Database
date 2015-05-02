<!DOCTYPE html>
<html>
<body>
  <pre>#! /bin/sh

echo &quot;Checking Assignment 3 (Part 1) Solutions&quot; &gt; results.txt
echo &quot;&quot; &gt;&gt; results.txt

for query in q1 q2 q3 q4 q5 q6
do
   echo &quot;============================== Query&quot; $query &quot; ==============================&quot; &gt;&gt; results.txt
   echo &quot;&quot; &gt;&gt; results.txt
   # First run the query without any xmllinting.  
   # Even ill-formed xml work work here.
   echo &quot;------ raw output ------&quot; &gt;&gt; results.txt
   echo &quot;&quot; &gt;&gt; results.txt
   galax-run $query.xq &gt;&gt; results.txt 2&gt;&amp;1
   echo &quot;&quot; &gt;&gt; results.txt

   # Now run the queries and produce formatted output using xmllint.  
   # Only well-formed xml will work here.
   echo &quot;------ formatted output (therefore well-formed) ------&quot; &gt;&gt; results.txt
   echo &quot;&quot; &gt;&gt; results.txt
   echo &quot;&lt;?xml version='1.0' standalone='no' ?&gt;&quot; &gt; TEMP.xml
   galax-run $query.xq &gt;&gt; TEMP.xml  2&gt;&amp;1
   xmllint --format TEMP.xml &gt;&gt; results.txt  2&gt;&amp;1
   echo &quot;&quot; &gt;&gt; results.txt

   # Now validate the output of the queries.
   echo &quot;------ checking validity of output ------&quot; &gt;&gt; results.txt
   echo &quot;&quot; &gt;&gt; results.txt
   echo &quot;&lt;?xml version='1.0' standalone='no' ?&gt;&quot; &gt; TEMP.xml
   echo -n &quot;&lt;!DOCTYPE &quot; &gt;&gt; TEMP.xml
   # Put the right doctype in, which depends on the query.
   if [ &quot;$query&quot; = &quot;q1&quot; ]; then
      echo -n &quot;noplaylist&quot; &gt;&gt; TEMP.xml
   fi
   if [ &quot;$query&quot; = &quot;q2&quot; ]; then
      echo -n &quot;fewfollowers&quot; &gt;&gt; TEMP.xml
   fi
   if [ &quot;$query&quot; = &quot;q3&quot; ]; then
      echo -n &quot;favourites&quot; &gt;&gt; TEMP.xml
   fi
   if [ &quot;$query&quot; = &quot;q4&quot; ]; then
      echo -n &quot;pairs&quot; &gt;&gt; TEMP.xml
   fi
   if [ &quot;$query&quot; = &quot;q5&quot; ]; then
      echo -n &quot;popularity&quot; &gt;&gt; TEMP.xml
   fi
   if [ &quot;$query&quot; = &quot;q6&quot; ]; then
      echo -n &quot;songcounts&quot; &gt;&gt; TEMP.xml
   fi
   echo &quot; SYSTEM '&quot;$query&quot;.dtd'&gt;&quot; &gt;&gt; TEMP.xml
   galax-run $query.xq &gt;&gt; TEMP.xml  2&gt;&amp;1
   echo &quot;Results valid? (no news is good news)&quot; &gt;&gt; results.txt
   xmllint --noout --valid TEMP.xml &gt;&gt; results.txt  2&gt;&amp;1
   echo &quot;&quot; &gt;&gt; results.txt
done
</pre>
</body>
</html>
