---
layout: post
title: Unicode Entity Markup
author: polarysekt
---

# Unicode Entity Markup

## Programatically

### Instead of hand-coding an HTML entities reference document, let's code it:

**Create Project Folder:**     "gw_html-entity" ( referred to as ./ )

**Create Source Folder:**     "./src"

**Create Source File:**    "./src/main.cpp"
<h4>Code main.cpp:</h4>

```c++
#include <iostream>
#include <string>

int main ( ) {
    int entExtent = 500;   // what is the limit??

    std::cout << "&lt;!DOCTYPE html&gt;\n";
    std::cout << "&lt;html&gt;\n&lt;head&gt;\n";
    std::cout << "&lt;title&gt;HTML Entities&lt;/title&gt;\n";
    std::cout << "&lt;/head&gt;\n";
    std::cout << "&lt;body&gt;\n";

    std::cout << "by &lt;a href='http://polarysekt.github.io/'&gt;polarysekt&lt;/a&gt;&lt;";
    std::cout << "hr color='#00f700'/&gt;\n";

    for( int cx=0;cx &lt; entExtent;cx++ ) {
        std::cout << "&lt;b&gt;&amp;amp;#" << cx << ":&lt;/b&gt; &amp;#" << cx << ";";
        std::cout << "&lt;br/&gt;\n";
    }

    std::cout << "&lt;/body&gt;\n";
    std::cout << "&lt;/html&gt;\n";

    return 0;
}
```

To simplify things, we'll stream all the HTML to stdout (<em>usually</em> the console...)

**Compile Source File:**
Generally I use my standard makefile (shared soon?)...
(here's the makefile steps...)

```sh
$  mkdir -p build/obj
$  mkdir -p build/bin
$  g++ -O2 -Wall -c -o build/obj/main.o src/main.cpp
$  g++ -O2 -Wall -o build/bin/gw_html-entity-gen-0.0.0.2 build/obj/main.o
$  ln -sf -T build/bin/gw_html-entity-gen-0.0.0.2 gw_html-entity-gen
```

Lines 1 & 2 make the following three folders:

*( the -p option creates parent directories as needed )*

1. ./build
1. ./build/obj
1. ./build/bin

This may be a bit much for our purposes, but this build method scales quite well.

The 3rd line creates an object file .o for our source file.
In the event that we had multiple files in our source directory, they would also be compiled into modules.

The following lines from the makefile (in bold) enumerate the .cpp source files:
```
PATHSRC        = src/
PATHBUILD    = build/
PATHOBJ        = build/obj/
PATHBIN        = build/bin/

**CXXCORESRC    := $(wildcard $(PATHSRC)*.cpp) COREOBJ        := $(patsubst $(PATHSRC)%.cpp,$(PATHOBJ)%.o,$(CXXCORESRC))**
```
And the following compile them to .o:
```
$(PATHOBJ)%.o: $(PATHSRC)%.cpp
 ****    ****$(CXX) $(CXXFLAGS) -c -o $@

lt;
```
All you need to do is set ${COREOBJ} as a build requirement for the target:
```makefile
APP_NAME=gw_html-entity-gen
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

**$(BINTARGET): ${COREOBJ} **
**    $(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINTARGET) $^ $(LIBS)**
```
And now for something neat: a really cheap build counter!
```
BUILDLOG    = $(PATHBUILD)buildLOG
 **    @echo -n "X" &gt;&gt; $(BUILDLOG);**
 @echo -n "Build Count: ";
 **    @stat -c%s $(BUILDLOG);**
```
Basically we're outputting a single character ("X") to a file. The size of the file (for single-byte character encoding) is the build count. (When it finally comes time that character encoding is an issue, we'll revisit -- but for now... let's encode some HTML...)

**Execute the Binary**
```
./ $  gw_html-entity-gen

&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;HTML Entities&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
...
```
Good! We're getting somewhere. That definitely looks like a page now, in beautiful console text.

So how do we get that to a file? Copy/Paste? Hell no@!
```
./ $  gw_html-entity-gen &gt; "html-entity.html"
./ $  firefox html-entity.html
```
~peace ; )
<h3>---&gt; Appendix???</h3>
Now -- to make it a command...

**Install the Binary**

The installation is automated in the makefile as well (as of tonight, 30-aug):
```
    USRBIN        = /usr/bin/
    INSTALLTO    = $(USRBIN)$(APP_NAME).version/

    @mkdir -p $(INSTALLTO)
    @cp $(BINTARGET) $(INSTALLTO)
    @ln -sf -T $(INSTALLTO)$(BINFULLV) $(USRBIN)$(BINFULL)
    @chmod 755 $(USRBIN)$(BINFULL)
```
... okay... you got me, this is still a work in progress... I was having some difficulty navigating through some of the variables in the makefile and also ran into a caveat with the intended method.

the INSTALLTO was changed to append .version so the ln command wouldn't fail due to an existing directory of the same name. ( .versioning seemed too clumsy ).