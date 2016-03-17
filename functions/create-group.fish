function create-group --argument name
    print-status iam/create-group $name
    aws iam create-group --group-name $name
end
