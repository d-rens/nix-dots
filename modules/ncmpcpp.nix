{ config, pkgs, ...}:

{
    programs = {
      ncmpcpp = {
        enable = true;
        settings = {
            external_editor = "nvim";
            message_delay_time = 1;
            playlist_disable_highlight_delay = 2;
            autocenter_mode = "yes";
            centered_cursor = "yes";
            ignore_leading_the = "yes";
            allow_for_physical_item_deletion = "no";
            connected_message_on_startup = "yes";
            cyclic_scrolling = "yes";
            mouse_support = "yes";
            mouse_list_scroll_whole_page = "yes";
            lines_scrolled = "1";
            playlist_shorten_total_times = "yes";
            playlist_display_mode = "columns";
            browser_display_mode = "columns";
            search_engine_display_mode = "columns";
            playlist_editor_display_mode = "columns";
            user_interface = "classic";
            follow_now_playing_lyrics = "yes";
            display_bitrate = "no";
            startup_screen = "playlist";
            visualizer_data_source = "/tmp/mpd.fifo";
            visualizer_output_name = "my_fifo";
            visualizer_in_stereo = "no";
            visualizer_type = "ellipse";
            visualizer_fps = "30";
            visualizer_look = "●▮";
            progressbar_color = "black";
            progressbar_elapsed_color = "magenta";
            header_visibility = "yes";
            statusbar_visibility = "yes";
            titles_visibility = "yes";
            now_playing_prefix = "$b$8$7 ";
            now_playing_suffix = "  $/b$8";
            current_item_prefix = "$b$7$/b$3 ";
            current_item_suffix = "  $8";
            song_status_format= "$7%t";
            song_list_format = "$8%a - %t$R  %l";
            song_library_format = "{{%a - %t} (%b)}|{%f}";
            song_window_title_format = "Music";
            song_columns_list_format = "(20)[]{a} (50)[white]{t|f:Title} (20)[cyan]{b} (7f)[magenta]{l}";
        };
          bindings = [
            { key = "+"; command = "show_clock"; }
            { key = "."; command = "show_lyrics"; }
            { key = "="; command = "volume_up"; }
            { key = "G"; command = "move_end"; }
            { key = "N"; command = "previous_found_item"; }
            { key = "P"; command = "show_playlist"; }
            { key = "U"; command = "update_database"; }
            { key = "ctrl-d"; command = "page_down"; }
            { key = "ctrl-u"; command = "page_up"; }
            { key = "d"; command = "page_down"; }
            { key = "f"; command = "change_browse_mode"; }
            { key = "f"; command = "show_browser"; }
            { key = "g"; command = "move_home"; }
            { key = "h"; command = "jump_to_parent_directory"; }
            { key = "h"; command = "previous_column"; }
            { key = "j"; command = "scroll_down"; }
            { key = "k"; command =  "scroll_up"; }
            { key = "l"; command = "enter_directory"; }
            { key = "l"; command = "next_column"; }
            { key = "l"; command = "play_item"; }
            { key = "l"; command = "run_action"; }
            { key = "m"; command = "show_media_library"; }
            { key = "m"; command = "toggle_media_library_columns_mode"; }
            { key = "n"; command = "next_found_item"; }
            { key = "s"; command = "reset_search_engine"; }
            { key = "s"; command = "show_search_engine"; }
            { key = "t"; command = "show_tag_editor"; }
            { key = "u"; command = "page_up"; }
            { key = "v"; command = "show_visualizer"; }
            { key = "x"; command = "delete_playlist_items"; }
          ];
    };
};
}
