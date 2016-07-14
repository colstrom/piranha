function create-user --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage create-user '<name>'
        return (false)
    end

    aws iam create-user --user-name $name
    print $argv --tag=create-user --(state $status)
end
