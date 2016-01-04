function add-users-to-group --argument-names group
    print-status iam/add-users-to-group $group
    group-exists $group
    and for user in (list-users-in-group $group)
        add-user-to-group $user $group
    end
end
