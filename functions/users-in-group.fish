function users-in-group --argument group
    trace (status --current-filename) $argv

    if empty "$group"
        usage users-in-group '<group>'
        return (false)
    end

    get groups/$group/users
end
