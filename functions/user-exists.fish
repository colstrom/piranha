function user-exists --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage user-exists '<name>'
        return (false)
    end

    aws iam get-user --user-name $name > /dev/null ^ /dev/null
    print $argv --tag=user-exists --(state $status)
end
