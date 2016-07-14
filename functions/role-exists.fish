function role-exists --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage role-exists '<name>'
        return (false)
    end

    aws iam get-role --role-name $name > /dev/null ^ /dev/null
    print $argv --tag=role-exists --(state $status)
end
