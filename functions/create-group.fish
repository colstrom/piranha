function create-group --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage create-group '<name>'
        return (false)
    end

    aws iam create-group --group-name $name
    print $argv --tag=create-group --(state $status)
end
