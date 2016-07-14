function update-roles
    trace (status --current-filename) $argv

    for role in (get roles)
        role-exists $role
        or create-role $role
        and for policy in (get roles/$role/policies)
            apply-policy roles/$role/policies/$policy
        end
    end
end
