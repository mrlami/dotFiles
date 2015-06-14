window_root "~/Downloads"
new_window "mx-window"

run_cmd "ssh mrlami@mx-dev"

split_h 50
run_cmd "ssh mrlami@mx-uat"

split_v 67
run_cmd "ssh mrlami@mx-oakland"

split_v 50
run_cmd "ssh mrlami@mx-play"

select_pane 0
split_v 50
run_cmd "ssh mrlami@mx-live"

select_pane 0