function update-users
    for user in (get iam/users)
        user-exists $user
        or create-user $user
        and for policy in (get iam/users/$user/policies)
            apply-policy iam/users/$user/policies/$policy
        end
    end
end
