function role-exists --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage role-exists '<name>'
        return (false)
    end

    print-status role-exists $name
    aws iam get-role --role-name $name > /dev/null ^ /dev/null
end
