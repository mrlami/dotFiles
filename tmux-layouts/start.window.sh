window_root "~/Downloads"
new_window "Start Window"

split_h 50
run_cmd "ssh lami@scbz-uat-web1"

split_v 50
run_cmd "ssh mrlami@mx-dev"

select_pane 0