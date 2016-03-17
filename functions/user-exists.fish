function user-exists --argument name
    print-status iam/user-exists $name
    aws iam get-user --user-name $name > /dev/null ^ /dev/null
end
