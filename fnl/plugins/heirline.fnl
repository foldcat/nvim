{1 :rebelot/heirline.nvim 
   :event :VeryLazy
   :config 
   (fn []
     (let [hline (require :heirline)
           conditions (require :heirline.conditions)
           utils (require :heirline.utils)]

       (local colors
        {:blue (. (utils.get_highlight :Function) :fg)
         :bright_bg (. (utils.get_highlight :Folded) :bg)
         :bright_fg (. (utils.get_highlight :Folded) :fg)
         :cyan (. (utils.get_highlight :Special) :fg)
         :dark_red (. (utils.get_highlight :DiffDelete) :bg)
         :diag_error (. (utils.get_highlight :DiagnosticError) :fg)
         :diag_hint (. (utils.get_highlight :DiagnosticHint) :fg)
         :diag_info (. (utils.get_highlight :DiagnosticInfo) :fg)
         :diag_warn (. (utils.get_highlight :DiagnosticWarn) :fg)
         :git_add (. (utils.get_highlight :diffAdded) :fg)
         :git_change (. (utils.get_highlight :diffChanged) :fg)
         :git_del (. (utils.get_highlight :diffDeleted) :fg)
         :gray (. (utils.get_highlight :NonText) :fg)
         :green (. (utils.get_highlight :String) :fg)
         :orange (. (utils.get_highlight :Constant) :fg)
         :purple (. (utils.get_highlight :Statement) :fg)
         :red (. (utils.get_highlight :DiagnosticError) :fg)})

       (hline.load_colors colors)
       (local Vi-mode 
        {:init (fn [self] (set self.mode (vim.fn.mode 1)))
         :static {:mode_colors {"\019" :purple
                                "\022" :red
                                :! :red
                                :R :orange
                                :S :purple
                                :V :cyan
                                :c :orange
                                :i :green
                                :n :red
                                :r :orange
                                :s :purple
                                :t :red
                                :v :cyan}}
                 :update {1 :ModeChanged
                          :callback 
                          (vim.schedule_wrap
                           (fn []
                             (vim.cmd :redrawstatus
                                       :pattern "*:*")))}
         :provider 
         (fn [self]
           (.. "%2(" self.mode "%)"))
         :hl (fn [self]
               (local mode (self.mode:sub 1 1))
               {:bold true 
                :fg (. self.mode_colors mode)})})

      (var File-name-block
       {:init (fn [self] (set self.filename (vim.api.nvim_buf_get_name 0)))})

      (local File-name {:hl {:fg :orange}
                        :provider (fn [self]
                                    (var filename
                                         (vim.fn.fnamemodify self.filename ":."))
                                    (when (= filename "")
                                      (lua "return \"[No Name]\""))
                                    (when (not (conditions.width_percent_below (length filename)
                                                                               0.25))
                                      (set filename (vim.fn.pathshorten filename)))
                                    filename)})

      (local File-flags [{:condition (fn [] vim.bo.modified)
                          :hl {:fg :green}
                          :provider " [+]"}
                         {:condition (fn []
                                       (or (not vim.bo.modifiable) vim.bo.readonly))
                          :hl {:fg :pink}
                          :provider " [x]"}])

      (local File-name-modifer
             {:hl (fn [] (when vim.bo.modified {:bold true :fg :red :force true}))})

      (set File-name-block
           (utils.insert File-name-block
                         (utils.insert File-name-modifer File-name) File-flags
                         {:provider "%<"}))

      (local LSPActive {:condition conditions.lsp_attached
                        :hl {:bold true :fg :green}
                        :provider (fn []
                                    (local names {})
                                    (each [_ server (pairs (vim.lsp.get_clients {:bufnr 0}))]
                                      (table.insert names server.name))
                                    (.. "[" (table.concat names " ") "]"))
                        :update [:LspAttach :LspDetach]})

      (local Git {1 {:hl {:bold true}
                     :provider (fn [self] self.status_dict.head)}
                  2 {:condition (fn [self] self.has_changes) :provider "("}
                  3 {:hl {:fg :purple}
                     :provider (fn [self] (local count (or self.status_dict.added 0))
                                 (and (> count 0) (.. "+" count)))}
                  4 {:hl {:fg :red}
                     :provider (fn [self]
                                 (local count (or self.status_dict.removed 0))
                                 (and (> count 0) (.. "-" count)))}
                  5 {:hl {:fg :blue}
                     :provider (fn [self]
                                 (local count (or self.status_dict.changed 0))
                                 (and (> count 0) (.. "~" count)))}
                  6 {:condition (fn [self] self.has_changes) :provider ")"}
                  :condition conditions.is_git_repo
                  :hl {:fg :orange}
                  :init (fn [self]
                          (set self.status_dict vim.b.gitsigns_status_dict)
                          (set self.has_changes
                               (or (or (not= self.status_dict.added 0)
                                       (not= self.status_dict.removed 0))
                                   (not= self.status_dict.changed 0))))})

      (local Scroll-bar 
       {:hl {:bg :bright_bg :fg :purple}
        :provider (fn [self]
                    (local curr-line
                           (. (vim.api.nvim_win_get_cursor 0) 1))
                    (local lines (vim.api.nvim_buf_line_count 0))
                    (local i
                           (+ (math.floor (* (/ (- curr-line 1)
                                                lines)
                                             (length self.sbar)))
                              1))
                    (string.rep (. self.sbar i) 2))
        :static {:sbar ["▁"
                        "▂"
                        "▃"
                        "▄"
                        "▅"
                        "▆"
                        "▇"
                        "█"]}})

      (local Ruler {:provider "%7(%l/%3L%):%2c %P"})

      (local Align {:provider "%="})
      (local Space {:provider " "})
 
      (local statusline [Vi-mode Space File-name-block Space LSPActive Align Git Space Ruler Space Scroll-bar])

      (hline.setup 
        {:statusline statusline})))}
