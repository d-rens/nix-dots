# Source wal colorscheme
try:
    import os
    colorscheme = os.environ['WAL_COLORS']
    if colorscheme:
        execute_command('set colorscheme ' + colorscheme)
except:
