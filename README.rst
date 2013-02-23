Simple vimrc set up using Vundle
================================

Getting started
---------------
To get started using this exact repo, clone and make it ``~/.vim``.

You need to manually install Vundle_ itself::

   $ mkdir -p ~/.vim/bundle
   $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Then symlink ``~/.vimrc`` to ``~/.vim/vimrc`` (after moving any existing
``~/.vimrc`` you have to ``~/.vim/``.)

Start ``vim`` and run ``:BundleInstall`` to download the bundles from the
remote sources. Restart vim to be safe and enjoy the awesomeness.

Notable plugins added
---------------------

- CtrlP_ is kind of like Command-T, but better! I have set to ``:CtrlPMixed``
  by default, but you can change the ``g:ctrlp_cmd`` to ``:CtrlP`` for the
  default operation.

- I'm currently in trial mode going from PyFlakesVim_ to Syntastic_, partly
  since Syntastic can also check other languages (notably JS for me).

- fugitive.vim_ is a pretty amazing Git wrapper that seems to speed up my git
  workflow.

- powerline_ I install outside of Vundle using pip since I also want it for
  my bash prompt.

.. _Vundle: https://github.com/gmarik/vundle
.. _CtrlP: http://kien.github.com/ctrlp.vim
.. _PyFlakesVim: https://github.com/kevinw/pyflakes-vim
.. _Syntastic: https://github.com/scrooloose/syntastic
.. _fugitive.vim: https://github.com/tpope/vim-fugitive
.. _powerline: https://github.com/Lokaltog/powerline
