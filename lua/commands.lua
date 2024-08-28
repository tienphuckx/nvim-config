-- Function to compile the current C++ file
function getFileExtension(filename)
  return filename:match("^.+%.(.+)$")
end

function CompileDebug()
  local command = ''
  local current_file = vim.fn.expand('%')
  local ext = getFileExtension(current_file)
  local output_file = string.gsub(current_file, '%.' .. ext .. '$', '')
  print("ext: " .. ext)
  if ext then
    if ext == "c" then
      command = 'gcc -g -o ' .. output_file .. ' ' .. current_file
    elseif ext == "cpp" then
      command = 'g++ -g -o ' .. output_file .. ' ' .. current_file
    elseif ext == "rs" then
      command = 'rustc -C opt-level=0 -C debuginfo=full ' .. current_file
    end
  end
  if command ~= nil then
    vim.api.nvim_command('!' .. command)
  end
end

-- Key mapping to compile the current C++ file
vim.api.nvim_set_keymap('n', '<leader>bf', ':lua CompileDebug()<CR>', { noremap = true, silent = true })
