from ranger.colorschemes.default import Default
class Scheme(Default):
    progress_bar_color = '#00FF00'

    def __init__(self):
        self.bg = "#1a1b26"
        self.fg = "#a0b1d6"
        self.hl = "#ffffff"
        self.sel_bg = "#3e4452"
        self.sel_fg = "#a0b1d6"
        self.progress_bar_color = "#00FF00"
        self.cursor_bg = "#a0b1d6"
        self.cursor_fg = "#1a1b26"
        self.inactive_pane = "#4d4d4d"

    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if context.in_titlebar and context.hostname:
            fg = self.hl if context.bad else self.fg

        return fg, bg, attr

