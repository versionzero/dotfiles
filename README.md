> "These are a few of my favorite things." 
> - Oscar Hammerstein II

In this textual trove is an assortment of things that I've found to be
useful in my day-to-day work.  Some of the scripts are my own
creations, but most of them are borrowed.  As time permits I'll add in
credit where credit is due.  For now, just assume that someone far
more clever and resourceful than I wrote them.

To use the dot files, you only need to clone the repository:

    $ git clone git@github.com:versionzero/dotfiles.git

After that, using it requires just two commands:

    $ cd dotfiles; ./update.sh

That is it!  Just restart your terminal, and you'll have everything up
and running.  If you make changes to the files in the `dotfiles`
directory, and you want to reinstall the changes without restarting
the terminal, you run the following command:

    $ source

It is an alias for `source` that---when given no command line
options---will evaluate the `~/.bash_profile` file automatically.
Simply put: all your changes will be immediately available.

If you have any comments or improvements, just push them my way.
