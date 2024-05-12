<!--toc:start-->
- [Dependencies](#dependencies)
- [How to use](#how-to-use)
- [TODO](#todo)
<!--toc:end-->

# Dependencies
- ripgrep for fzf-lua.
- Language servers (LS) are not installed, mason is not used. Either install manually or use the home-manager config.
- Tree-sitter config doesn't auto install correctly yet, if some are not installed use `TSInstall <language>` or `TSInstall all`.

# How to use
- Use '<leader>' which is '<space>' for most plugin actions. Wait 1 second for Which-Key to show all possible combinations.
- Almost all other vim keybindings are left as is.

# TODO
- Add c++ debugger
- nvim-treesitter-textobjects.nvim for improved "block" movements(see https://www.youtube.com/watch?v=CEMPq_r8UYQ)
- Look into replacing lspsaga:
    - Peeking could be done by https://github.com/rmagatti/goto-preview.
    - hover: vim.lsp.buf.hover. Don't know how to do the hover-stay thing yet.
    - go-to: vim.lsp.buf.(type_)definition. "declaration" is apparently not implemented as much, see how it affects cpp.
    - rename: vim.lsp.buf.rename.
    - breadcrumbs: No idea yet.
    - Symbol to show code-actions.
- nvim-bqf (better quick fix list).
    - replacer.nvim might make things even better.
- Buffer management remains suboptimal.
    - Perhaps the new fzf-lua plugin can play a role?
- Look into simplifying cmp, contenders:
    - https://github.com/ms-jpq/coq_nvim.
    - https://github.com/echasnovski/mini.completion.
