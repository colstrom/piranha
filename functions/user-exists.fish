function user-exists --argument name
    if empty "$name"
        usage user-exists '<name>'
        return (false)
    end

    print-status iam/user-exists $name
    aws iam get-user --user-name $name > /dev/null ^ /dev/null
end
