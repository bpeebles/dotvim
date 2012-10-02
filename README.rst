Simple vimrc set up using Vundle
================================

Getting started
---------------
To get started using this exact repo, clone and make it ``~/.vim``.

Then symlink ``~/.vimrc`` to ``~/.vim/vimrc``.

Start ``vim`` and run ``:BundleInstall`` to download the bundles from the
remote sources. Restart vim to be safe and enjoy the awesomeness.

Notable plugins added
---------------------

- CtrlP_ is kind of like Command-T, but better! I have set to ``:CtrlPMixed``
  by default, but you can change the ``g:ctrlp_cmd`` to ``:CtrlP`` for the
  default operation.

- PyFlakesVim_ runs pyflakes in the background and does highlighting based on
  msitakes/warnings. Apparently the new hotness is Syntastic_, but I haven't
  upgraded yet.

Little notes
------------

I haven't converted to Vundle for my color schemes yet for some reason. I actually have it set to use a customzied version of ``desert256`` I call ``desert256bdp``.

I'm not sure I'm really happy with the settings ``pythonrc.vim`` give me, but
some are better than Vim defaults.


.. _CtrlP: http://kien.github.com/ctrlp.vim
.. _PyFlakesVim: https://github.com/kevinw/pyflakes-vim
.. _Syntastic: https://github.com/scrooloose/syntastic
