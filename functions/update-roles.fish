function update-roles
    for role in (get iam/roles)
        role-exists $role
        or create-role $role
        and for policy in (get iam/roles/$role/policies)
            apply-policy iam/roles/$role/policies/$policy
        end
    end
end
