(local map vim.keymap.set)

(vim.api.nvim_create_user_command "Sex"
  (fn []
    (vim.cmd :split)
    (vim.cmd :Oil))
  {:desc "Oil split open"})
 
(vim.api.nvim_create_user_command "Vex"
  (fn []
    (vim.cmd :vsplit)
    (vim.cmd :Oil))
  {:desc "Oil vsplit open"})

(vim.api.nvim_create_user_command "Ex"
  (fn []
    (vim.cmd :Oil))
  {:desc "Oil open"})

(map "n" ";" ":" {:desc "CMD enter command mode"})

(map "n" "<Esc>" "<cmd>noh<cr>" {:desc "Clear highlight"})

(map "n" "<leader>fn" ":Oil <CR>" {:desc "turn on netrw"})

(map "n" "<leader>fm" 
     (fn []
       (local conform (require :conform))
       (conform.format {:async true
                        :lsp_format :fallback}))
     {:desc "format buffer"})

(var oil-open? false)

(map "n" "<leader>e" 
     (fn []
       (vim.cmd :Oil)
       (set oil-open? true))
     {:desc "oil open parent directory"})

(map "n" "<C-n>"
     (fn []
       (let [oil (require :oil)]
         (if oil-open?
             (do 
               (oil.close)
               (set oil-open? false))
             (do 
               (vim.cmd :Oil)
               (set oil-open? true)))))
     {:desc "oil toggle"})
