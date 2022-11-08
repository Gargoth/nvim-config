lua << EOF
require('telescope').setup {
  defaults = { file_ignore_patterns = {"node_modules", "venv", "__pycache__"} },
}
EOF

