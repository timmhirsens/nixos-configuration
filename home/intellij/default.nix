{ pkgs, ... }: {
  home.packages = [ pkgs.jetbrains-toolbox ];
  home.file.".ideavimrc" = {
    text = ''
      "" -- Suggested options --
      " Show a few lines of context around the cursor. Note that this makes the
      " text scroll if you mouse-click near the start or end of the window.
      set scrolloff=5
      set incsearch
      set surround
      set clipboard+=ideaput
      set ideajoin
      set hlsearch
      set ignorecase
      set smartcase
      set ideaput
      set relativenumber
      set number
      set surround
      set highlightedyank
      set idearefactormode=keep
      set showmode
      set NERDTree
      set commentary
      set easymotion

      " Don't use Ex mode, use Q for formatting.
      map Q gq


      "" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
      "" Map \r to the Reformat Code action
      "map \r <Action>(ReformatCode)

      "" Map <leader>d to start debug
      "map <leader>d <Action>(Debug)

      "" Map \b to toggle the breakpoint on the current line
      "map \b <Action>(ToggleLineBreakpoint)


      " Find more examples here: https://jb.gg/share-ideavimrc
      " formatting
      nnoremap == :action ReformatCode <CR>
      vnoremap == :action ReformatCode <CR>
      nnoremap -- :action OptimizeImports <CR>
      vnoremap -- :action OptimizeImports <CR>

      nnoremap cc :action CommentByLineComment <CR>
      vnoremap cc :action CommentByLineComment <CR>

      nnoremap ,a :action GotoAction <CR>
      vnoremap ,a :action GotoAction <CR>

      " delete without yanking
      nnoremap <leader>d "_d
      vnoremap <leader>d "_d

      " replace currently selected text with default register
      " without yanking it
      vnoremap <leader>p "_dP

      " clear highlighting after searching
      nmap <esc><esc> :noh<CR>

      " Leader
      nnoremap <SPACE> <Nop>
      let mapleader = " "

      map <leader>f <Action>(EditorCompleteStatement)
      map <leader>e <Plug>(easymotion-f)
      map <leader>r <Action>(RenameElement)

      " Show Intents
      map <leader>h <Action>(ShowIntentionActions)
      " Generate (g)
      map <leader>gc <Action>(GenerateConstructor)
      map <leader>ggs <Action>(GenerateGetterAndSetter)
      map <leader>gj <Action>(GenerateJavadoc)
      " Introduce (i)
      map <leader>iv <Action>(IntroduceVariable)
    '';
  };
}
