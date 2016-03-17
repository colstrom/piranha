function update-groups
    for group in (get groups)
        group-exists $group
        or create-group $group
        and begin
            for policy in (get groups/$group/policies)
                apply-policy groups/$group/policies/$policy
            end
            for user in (get groups/$group/users)
                add-user-to-group $user $group
            end
        end
    end
end
