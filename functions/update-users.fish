function update-users
    for user in (get users)
        user-exists $user
        or create-user $user
        and for policy in (get users/$user/policies)
            apply-policy users/$user/policies/$policy
        end
    end
end
