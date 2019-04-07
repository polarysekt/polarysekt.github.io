---
layout: post
title: Unicode Entity Markup
author: polarysekt
---

<h4>Instead of hand-coding an HTML entities reference document, let's code it:</h4>
<strong>Create Project Folder:</strong>     "gw_html-entity" ( referred to as ./ )

<strong>Create Source Folder:</strong>     "./src"

<strong>Create Source File:</strong>    "./src/main.cpp"
<h4>Code main.cpp:</h4>
<blockquote>
<pre>#include &lt;iostream&gt;
#include &lt;string&gt;

int main ( ) {

    int entExtent = 500;   // what is the limit??

    std::cout &lt;&lt; "&lt;!DOCTYPE html&gt;\n";
    std::cout &lt;&lt; "&lt;html&gt;\n    &lt;head&gt;\n        &lt;title&gt;HTML Entities&lt;/title&gt;\n    &lt;/head&gt;\n    &lt;body&gt;\n";

    std::cout &lt;&lt; "...quickly coded by &lt;a href='http://www.kb3c.co.nr/'&gt;[gsh]&lt;/a&gt;&lt;hr color='#00f700'/&gt;\n";

    for( int cx=0;cx &lt; entExtent;cx++ )
        std::cout &lt;&lt; "        &lt;b&gt;&amp;amp;#" &lt;&lt; cx &lt;&lt; ":&lt;/b&gt; &amp;#" &lt;&lt; cx &lt;&lt; ";" &lt;&lt; "&lt;br/&gt;\n";

    std::cout &lt;&lt; "    &lt;/body&gt;\n&lt;/html&gt;\n";
    std::cout &lt;&lt; "&lt;!-- kb3c.uX :: [gsh] : gw_html-entity _ 30-AUG-2011 --&gt;\n";

    return 0;

}</pre>
</blockquote>
To simplify things, we'll stream all the HTML to stdout (<em>usually</em> the console...)

<strong>Compile Source File:</strong>
Generally I use my standard makefile (shared soon?)...
(here's the makefile steps...)
<blockquote>
<pre>./ $  mkdir -p build/obj
./ $  mkdir -p build/bin
./ $  g++ -O2 -Wall -c -o build/obj/main.o src/main.cpp
./ $  g++ -O2 -Wall -o build/bin/gw_html-entity-gen-0.0.0.2 build/obj/main.o
./ $  ln -sf -T build/bin/gw_html-entity-gen-0.0.0.2 gw_html-entity-gen</pre>
</blockquote>
The first two lines make the following three folders:
<em>( the -p option creates parent directories as needed )</em>
<ol>
 	<li>./build</li>
 	<li>./build/obj</li>
 	<li>./build/bin</li>
</ol>
This may be a bit much for our purposes, but this build method scales quite well.

The 3rd line creates an object file .o for our source file.
In the event that we had multiple files in our source directory, they would also be compiled into modules.

The following lines from the makefile (in bold) enumerate the .cpp source files:
<blockquote>
<pre>PATHSRC        = src/
PATHBUILD    = build/
PATHOBJ        = build/obj/
PATHBIN        = build/bin/

<strong>CXXCORESRC    := $(wildcard $(PATHSRC)*.cpp) COREOBJ        := $(patsubst $(PATHSRC)%.cpp,$(PATHOBJ)%.o,$(CXXCORESRC))</strong></pre>
</blockquote>
And the following compile them to .o:
<blockquote>
<pre>$(PATHOBJ)%.o: $(PATHSRC)%.cpp
 <strong><strong>    </strong></strong>$(CXX) $(CXXFLAGS) -c -o $@</pre>
<pre></pre>
<pre>lt;</pre>
</blockquote>
All you need to do is set ${COREOBJ} as a build requirement for the target:
<blockquote>
<pre>APP_NAME=gw_html-entity-gen
APP_VERSION_MAJOR=    0
APP_VERSION_MINOR=    0
APP_VERSION_RELEASE=    0
APP_VERSION_REVISION=    2
APP_VERSION=$(APP_VERSION_MAJOR).$(APP_VERSION_MINOR).$(APP_VERSION_RELEASE).$(APP_VERSION_REVISION)
BINTARGET    = $(PATHBIN)$(BINFULLV)
BINNAME        = $(APP_NAME)
BINEXT        =
BINFULL        = $(BINNAME)$(BINEXT)
BINFULLV    = $(BINNAME)-$(APP_VERSION)$(BINEXT)

<strong>$(BINTARGET): ${COREOBJ} </strong>
<strong>    $(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINTARGET) $^ $(LIBS)</strong></pre>
</blockquote>
And now for something neat: a really cheap build counter!
<blockquote>
<pre>BUILDLOG    = $(PATHBUILD)buildLOG
 <strong>    @echo -n "X" &gt;&gt; $(BUILDLOG);</strong>
 @echo -n "Build Count: ";
 <strong>    @stat -c%s $(BUILDLOG);</strong></pre>
</blockquote>
Basically we're outputting a single character ("X") to a file. The size of the file (for single-byte character encoding) is the build count. (When it finally comes time that character encoding is an issue, we'll revisit -- but for now... let's encode some HTML...)

<strong>Execute the Binary</strong>
<blockquote>
<pre>./ $  gw_html-entity-gen

&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;HTML Entities&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
...</pre>
</blockquote>
Good! We're getting somewhere. That definitely looks like a page now, in beautiful console text.

So how do we get that to a file? Copy/Paste? Hell no@!
<blockquote>
<pre>./ $  gw_html-entity-gen &gt; "html-entity.html"
./ $  firefox html-entity.html</pre>
</blockquote>
~peace ; )
<h3>---&gt; Appendix???</h3>
Now -- to make it a command...

<strong>Install the Binary</strong>

The installation is automated in the makefile as well (as of tonight, 30-aug):
<blockquote>
<pre>    USRBIN        = /usr/bin/
    INSTALLTO    = $(USRBIN)$(APP_NAME).version/

    @mkdir -p $(INSTALLTO)
    @cp $(BINTARGET) $(INSTALLTO)
    @ln -sf -T $(INSTALLTO)$(BINFULLV) $(USRBIN)$(BINFULL)
    @chmod 755 $(USRBIN)$(BINFULL)</pre>
</blockquote>
... okay... you got me, this is still a work in progress... I was having some difficulty navigating through some of the variables in the makefile and also ran into a caveat with the intended method.

the INSTALLTO was changed to append .version so the ln command wouldn't fail due to an existing directory of the same name. ( .versioning seemed too clumsy ).