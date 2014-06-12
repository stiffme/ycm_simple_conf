YouCompleteMe Simple Configuration
==================================

Description
-----------

If you develop in C/C++ with Vim you probably know the great plugin
[YouCompleteMe][].

In order to use it, you have to write a `.ycm_extra_conf.py` python script
and copy it in your project directory. This script should provide needed
informations to compile your project. It is very tedious to copy it
each time you create a new project, because you just have to modify
a few part of it.

The solution proposed here is to keep a single
[python script](python/ycm_simple_conf.py)
and at each project creation write a `.ycm_simple_conf.xml` file that
contain only project-specific informations.

You can see an example just below:

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

Use the great plugin [NeoBundle][]
and just add this line in the appropriate section of your `.vimrc` file:

    NeoBundle "tdcdev/ycm_simple_conf"

If you want disable `ycm_simple_conf` add this line in your `.vimrc` file:

    let g:ycm_simple_conf_active = 0

Usage
-----

As you can see above, it is very easy to write the `.ycm_simple_conf.xml` file.
Project type can be **c** or **c++** and include paths can be absolute or
relative to the `.ycm_simple_conf.xml` file.

It is not necessary to add default compiler include paths, like
**/usr/include** or **/usr/local/include**, `ycm_simple_conf.py`
ask compiler for them.

Finally, you can see witch flags are set with [YouCompleteMe][] logfiles.

License
-------

This software is licensed under the [zlib license](LICENSE.txt).

[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
[NeoBundle]: https://github.com/Shougo/neobundle.vim
