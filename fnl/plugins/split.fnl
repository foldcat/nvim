{1 :mrjones2014/smart-splits.nvim
   :keys 
   [[:<A-h> (fn [] (let [split (require :smart-splits)] (split.resize_left)))]
    [:<A-j> (fn [] (let [split (require :smart-splits)] (split.resize_down)))]
    [:<A-k> (fn [] (let [split (require :smart-splits)] (split.resize_up)))]
    [:<A-l> (fn [] (let [split (require :smart-splits)] (split.resize_right)))]

    [:<C-h> (fn [] (let [split (require :smart-splits)] (split.move_cursor_left)))]
    [:<C-j> (fn [] (let [split (require :smart-splits)] (split.move_cursor_down)))]
    [:<C-k> (fn [] (let [split (require :smart-splits)] (split.move_cursor_up)))]
    [:<C-l> (fn [] (let [split (require :smart-splits)] (split.move_cursor_right)))]

    [:<leader><leader>h (fn [] (let [split (require :smart-splits)] (split.swap_buf_left)))]
    [:<leader><leader>j (fn [] (let [split (require :smart-splits)] (split.swap_buf_down)))]
    [:<leader><leader>k (fn [] (let [split (require :smart-splits)] (split.swap_buf_up)))]
    [:<leader><leader>l (fn [] (let [split (require :smart-splits)] (split.swap_buf_right)))]]
   :opts {}}
