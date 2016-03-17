function create-user --argument name
    if empty "$name"
        usage create-user '<name>'
        return (false)
    end

    print-status create-user $name
    aws iam create-user --user-name $name
end
