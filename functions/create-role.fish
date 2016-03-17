function create-role --argument name
    print-status create-role $name

    if empty "$name"
        usage create-role '<name>'
        return (false)
    end

    set --local role roles/$name
    set --local policy assume-role.json

    if has $policy $role
        aws iam create-role --role-name $name --assume-role-policy-document file://$role/$policy
    else
        print-status error "Expected to find policy at $role/$policy"
    end
end
