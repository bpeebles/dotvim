Simple vimrc set up using vim-plug
==================================

I currently use neovim_ but some of my ``vimrc`` will work with Vim 8+ (untested).

Getting started
---------------
To get started using this exact repo, clone and make it ``~/.vim``.

You need to manually install vim-plug_ itself::

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Then symlink ``~/.vimrc`` to ``~/.vim/vimrc`` (after moving/integrating any
existing ``~/.vimrc`` you have to ``~/.vim/``.)::

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim ~/.config/nvim

Install dependencies
~~~~~~~~~~~~~~~~~~~~

ncm2-jedi depends on the Jedi_ Python library, so go ahead and make a new Python 3 virtualenv named ``neovim3`` using pyenv, ideally, and then install jedi::

    pyenv virtualenv 3.8.3 neovim3 && pyenv activate neovim3
    pip install jedi

Finishing up
~~~~~~~~~~~~

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

- nvim-treesitter_ to try fancier/faster syntax highlighting and code selection

- vim-picker_ is a nice fuzzy picker that uses fzy_ and I've defined some keys to activate it.

- ale_, to check Python and other file types.

- fugitive.vim_ is a pretty amazing Git wrapper that seems to speed up my git workflow.

- lightline.vim_ I've switched from vim-airline_, after using power_line, since airline kept getting more busy and I figured I'd try something else.

.. _neovim: https://github.com/neovim/neovim
.. _vim-plug: https://github.com/junegunn/vim-plug
.. _nvim-treesitter: https://github.com/nvim-treesitter/nvim-treesitter
.. _vim-picker: https://github.com/srstevenson/vim-picker
.. _fzy: https://github.com/jhawthorn/fzy
.. _ale: https://github.com/w0rp/ale
.. _fugitive.vim: https://github.com/tpope/vim-fugitive
.. _powerline: https://github.com/Lokaltog/powerline
.. _vim-airline: https://github.com/bling/vim-airline
.. _lightline.vim: https://github.com/itchyny/lightline.vim
.. _Jedi: https://github.com/davidhalter/jedi
.. _unlicense: http://unlicense.org
