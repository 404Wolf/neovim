function TerminalOnBottomLayout()
  -- Split the window top and bottom (vertically)
  vim.cmd('split')

  -- Focus the bottom pane
  vim.cmd('wincmd j')

  -- Open terminal in the bottom pane
  vim.cmd('terminal')

  -- Resize the bottom pane 
  vim.cmd('resize 14')

  -- Focus the top pane
  vim.cmd('wincmd h')
  vim.cmd('wincmd k')
end

