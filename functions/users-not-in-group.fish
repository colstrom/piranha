function users-not-in-group --argument group
    trace (status --current-filename) $argv

    if empty "$group"
        usage users-not-in-group '<group>'
        return (false)
    end

    comm -13 (users-in-group $group | sort | psub) (get users | sort | psub)
end
