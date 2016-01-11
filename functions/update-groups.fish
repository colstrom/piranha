function update-groups
    for group in (get iam/groups)
        group-exists $group
        or create-group $group
        and begin
            for policy in (get iam/groups/$group/policies)
                apply-policy iam/groups/$group/policies/$policy
            end
            for user in (get iam/groups/$group/users)
                add-user-to-group $user $group
            end
        end
    end
end
