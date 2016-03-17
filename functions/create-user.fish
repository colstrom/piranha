function create-user --argument name
    print-status iam/create-user $name
    aws iam create-user --user-name $name
end
