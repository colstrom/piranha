function add-user-to-group --argument-names user group
    print-status iam/add-user-to-group "$user $group"
    aws iam add-user-to-group --user-name $user --group-name $group
end
