window_root "~/Downloads"
new_window "SGI Start Window"

run_cmd "ssh lami@scbz-uat-web1"

split_v 50
select_pane 0
run_cmd "ssh lami@scbz-uat-db1"

split_h 50
echo "health » writing » skills » work » errands"