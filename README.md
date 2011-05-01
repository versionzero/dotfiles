
"These are a few of my favorite things." 
- Oscar Hammerstein II

In this textal trove is an assorment of things that I've found to be
useful in my day to day work.  Some of the gems are mine, but most of
them are borrowed.  As time permist I'll add in credit where credit is
due.  For now, just asume far brighter than me wrote all of them.

To use the dot files, you only need to clone the repository:

  git clone git://blah/dotfiles.git

Then execute the following two commands:

  cd dotfiles
  ./install.sh

That is it!  Just restart your terminal, and you'll have everything up
and running.  If you make changes to the files in the dotfiles
directory, and reinstall the resulting changes, you can skip
restarting the terminal and run the following command:

  source

It is an alias for source that when given no command line options,
will evaluate the ~/.bash_profile file automatically in to the current
environment.  Meaning simply that all of your new changes will become
imediatly available.

If you have any comments or improvemets, just push them my way. Have
fun.

