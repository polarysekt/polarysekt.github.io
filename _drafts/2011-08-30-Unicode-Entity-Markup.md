---
layout: post
title: Unicode Entity Markup
author: polarysekt
---

# Unicode Entity Markup

NOTE: this post is still being revised (8 years later...). Originally written from a `C/C++` programmer perspective.

## Programatically with Javascript

*TODO:: Javascript version*

## Programatically with C++

*Instead of hand-coding an HTML entities reference document, let's hand code an app to generate it.*

1. Create Project Folder:  "html-entity-gen"
1. Create Source File:    "./src/main.cpp"

**main.cpp:**

```c++
#include <iostream>
#include <string>

int main ( ) {
    int entExtent = 500; // Set a hard limit

    std::cout << "<!DOCTYPE html>";
    std::cout << "<html><head>";
    std::cout << "<title>HTML Entities</title>";
    std::cout << "</head>";
    std::cout << "<body>";

    std::cout << "<h1>Entities</h1>"
    std::cout << "<h3><a href='http://polarysekt.github.io/'>polarysekt</a></h3>";
    std::cout << "<hr color='#00f700'/>";

    for( int cx=0;cx < entExtent;cx++ ) {
        std::cout << "<p><b>&amp;amp;#" << cx << ":</b> &amp;#" << cx << ";</p>";
    }

    std::cout << "</body>";
    std::cout << "</html>";

    return 0;
}
```

To simplify things, we'll stream all the HTML to stdout (<em>usually</em> the console...)

**Compile Source File:**
Generally I use a `makefile`, and some standard paths, but here's a simple way:

```sh
$  g++ -O2 -Wall -o html-entity-gen src/main.cpp
```

This should be enough for our purposes.


**Execute the Binary**

```sh
$  html-entity-gen

<!DOCTYPE html>
<html>
    <head>
        <title>HTML Entities</title>
    </head>
    <body>
...
```

Good! We're getting somewhere. That definitely looks like a page now, in beautiful console text.

**So let's go ahead and redirect that to a file:**

```sh
$  html-entity-gen > "html-entity.html"
```

Then just use your preferred browser to open:

*TODO:: use x11 default:*
```sh
$  !!! html-entity.html
```

```sh
$  chromium html-entity.html
```

```sh
$  firefox html-entity.html
```

Enjoy!

## Appendix

*TODO:: show full/complete makefile*
*TODO:: add targets (.PHONY,all,etc)*
*TODO:: add an exec/stream to file target*

### Project Initialization

1. Create Project Folder:  "html-entity-gen" ( referred to as ./ )
1. Create Source Folder:   "./src"
1. Create Source File:    "./src/main.cpp"

Code `./src/main.cpp` as above.

### A legit makefile

The following lines from the makefile (in bold) enumerate the .cpp source files:

```makefile
PATHSRC       = src/
PATHBUILD     = build/
PATHOBJ       = build/obj/
PATHBIN       = build/bin/

CXXCORESRC := $(wildcard $(PATHSRC)*.cpp) 
COREOBJ    := $(patsubst $(PATHSRC)%.cpp,$(PATHOBJ)%.o,$(CXXCORESRC))
```

And the following compile them to .o:

```makefile
$(PATHOBJ)%.o: $(PATHSRC)%.cpp
    $(CXX) $(CXXFLAGS) -c -o $@
```

All you need to do is set ${COREOBJ} as a build requirement for the target:

```makefile
APP_NAME            = html-entity-gen
APP_VERSION_MAJOR   = 0
APP_VERSION_MINOR   = 0
APP_VERSION_RELEASE = 0
APP_VERSION_REVISION= 3

APP_VERSION=$(APP_VERSION_MAJOR).$(APP_VERSION_MINOR).$(APP_VERSION_RELEASE).$(APP_VERSION_REVISION)

BINTARGET          = $(PATHBIN)$(BINFULLV)
BINNAME            = $(APP_NAME)
BINEXT             =
BINFULL            = $(BINNAME)$(BINEXT)
BINFULLV           = $(BINNAME)-$(APP_VERSION)$(BINEXT)

$(BINTARGET): ${COREOBJ}
    $(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINTARGET) $^ $(LIBS)
```

First iteration of a *REALLY EASY & CHEAP* build counter.

```makefile
BUILDLOG    = $(PATHBUILD)buildLOG

@echo -n "X" >> $(BUILDLOG);
@echo -n "Build Count: ";
@stat -c%s $(BUILDLOG);
```

Basically we're outputting a single character ("X") to a file. The size of the file (for single-byte character encoding) is the build count. (When it finally comes time that character encoding is an issue, we'll revisit -- but for now... let's encode some HTML...)

*TODO:: drop in newer versioning/build file with counter*

Now -- make it a command...

### Installation

The installation can be automated in the `makefile` as well:

```makefile
    USRBIN        = /usr/bin/
    INSTALLTO    = $(USRBIN)$(APP_NAME).version/

    @mkdir -p $(INSTALLTO)
    @cp $(BINTARGET) $(INSTALLTO)
    @ln -sf -T $(INSTALLTO)$(BINFULLV) $(USRBIN)$(BINFULL)
    @chmod 755 $(USRBIN)$(BINFULL)
```

