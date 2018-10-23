Simple vimrc set up using vim-plug
==================================

I currently use neovim_ but most of ``vimrc`` will work with Vim 8+.

Getting started
---------------
To get started using this exact repo, clone and make it ``~/.vim``.

You need to manually install vim-plug_ itself::

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Then symlink ``~/.vimrc`` to ``~/.vim/vimrc`` (after moving/integrating any
existing ``~/.vimrc`` you have to ``~/.vim/``.)::

   ln -s ~/.vim/vimrc ~/.vimrc

Start ``vim`` and run ``:PlugInstall`` to download the bundles from the remote
sources. Restart vim to be safe and enjoy the awesomeness.

License
-------

This file, vimrc, and the contents of the ``ftdetect`` directory are my original
work and are released under the unlicense_. See the file UNLICENSE for the full
license. Other files in this repository are the copyright of their original
creators.

Notable plugins used
--------------------

- vim-picker_ is a nice fuzzy picker that uses fzy_ and I've defined some keys to activate it.

- ale_, to check Python and other file types.

- fugitive.vim_ is a pretty amazing Git wrapper that seems to speed up my git
  workflow.

- vim-airline_ I've switched from using the new powerline_ to vim-airline since
  it's pure Vimscript and I've stopped using powerline for my bash prompt.

.. _neovim: https://github.com/neovim/neovim
.. _vim-plug: https://github.com/junegunn/vim-plug
.. _vim-picker: https://github.com/srstevenson/vim-picker
.. _fzy: https://github.com/jhawthorn/fzy
.. _ale: https://github.com/w0rp/ale
.. _fugitive.vim: https://github.com/tpope/vim-fugitive
.. _powerline: https://github.com/Lokaltog/powerline
.. _vim-airline: https://github.com/bling/vim-airline
.. _unlicense: http://unlicense.org
