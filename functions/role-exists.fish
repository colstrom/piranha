function role-exists --argument name
    print-status iam/role-exists $name
    aws iam get-role --role-name $name > /dev/null ^ /dev/null
end
