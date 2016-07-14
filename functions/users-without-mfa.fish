function users-without-mfa
    trace (status --current-filename) $argv

    comm -13 (users-with-mfa | sort | psub) (get users | sort | psub)
end
