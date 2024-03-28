return {
    "HakonHarnes/img-clip.nvim",
    event = "BufEnter",
    opts = {
        filetypes = {
            tex = {
relative_template_path = false,
template = [[
\begin{figure}
    \centering
    \includegraphics[width=0.8\linewidth]{$FILE_PATH}
    \caption{$CURSOR}
    \label{fig:$LABEL}
\end{figure}
]],
            },
        },
    },
    keys = {
        -- suggested keymap
        { "<leader>P", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
    },
}
