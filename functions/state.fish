function state --argument exit_status
    trace (status --current-filename) $argv

    if test "$exit_status" = "0"
        echo success
    else
        echo failure
        false
    end
end
