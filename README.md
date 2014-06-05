YouCompleteMe Simple Configuration
==================================

If you developp in C/C++ with Vim you probably know the great plugin
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe).

In order to get it work you have to write a `.ycm_extra_conf.py` python script
and put it in your project directory. This script should provide needed
informations to compile your project. It is very tedious to copy it
each time you create a new project, because you just have to modify
a few part of it.

The solution proposed here is to keep a single python script
and at each project creation write a `.ycm_simple_conf.xml` file that
contain only project-specific informations:

```xml
<project type="c++">
    <include path="/home/local/libA/include"/>
    <include path="/home/local/libB/include"/>
    <include path="include"/>
    <include path="build"/>
</project>
```

Installation
------------

Simply clone this repository somewhere, for instance in your ~/.vim directory:

    cd ~/.vim
    git clone https://github.com/tdcdev/ycm_simple_conf

Then you have to tell [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
where `ycm_simple_conf.py` is by adding this kinf of
declaration in your `.vimrc` file:

    let g:ycm_global_ycm_extra_conf='~/.vim/ycm_simple_conf/ycm_simple_conf.py'

Usage
-----

As you can see above, it is very easy to write the `.ycm_simple_conf.xml` file.
Project type can be **c** or **c++**, and include path can be absolute or
relative to the `.ycm_simple_conf.xml` file.

It is not necessary to add default compiler include paths, `ycm_simple_conf.py`
ask compiler for them.

You can see witch flags are set with logfiles in `/tmp/ycm/` on Linux.
