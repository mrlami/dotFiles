session_root "~/"

if initialize_session "sgi-session"; then
    load_window "sgi"
fi

finalize_and_go_to_session