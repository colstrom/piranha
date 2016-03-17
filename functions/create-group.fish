function create-group --argument name
    if empty "$name"
        usage create-group '<name>'
        return (false)
    end

    print-status iam/create-group $name
    aws iam create-group --group-name $name
end
