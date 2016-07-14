function group-exists --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage group-exists '<name>'
        return (false)
    end

    print-status group-exists $name
    aws iam get-group --group-name $name > /dev/null ^ /dev/null
end
