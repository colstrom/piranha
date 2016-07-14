function group-exists --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage group-exists '<name>'
        return (false)
    end

    aws iam get-group --group-name $name > /dev/null ^ /dev/null
    print $argv --tag=group-exists --(state $status)
end
