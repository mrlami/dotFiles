window_root "~/Downloads"
new_window "Start Window"

run_cmd "ssh scbz-uat-web1"

split_h 50
echo "health » writing » skills » work » errands"

select_pane 0
split_v 50
run_cmd "ssh mx-dev"