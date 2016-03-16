function create-role --argument-names name
    print-status iam/create-role $name

    if empty "$name"
        print-status usage 'create-role <name>'
        return -1
    end

    set --local role iam/roles/$name
    set --local policy assume-role.json

    if has $policy $role
        aws iam create-role --role-name $name --assume-role-policy-document file://$role/$policy
    else
        print-status error "Expected to find policy at $role/$policy"
    end
end
