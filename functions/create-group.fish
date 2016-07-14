function create-group --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage create-group '<name>'
        return (false)
    end

    print-status create-group $name
    aws iam create-group --group-name $name
end
