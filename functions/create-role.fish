function create-role --argument name
    trace (status --current-filename) $argv

    if empty "$name"
        usage create-role '<name>'
        return (false)
    end

    set --local role roles/$name
    set --local policy assume-role.json

    if has $policy $role
        aws iam create-role --role-name $name --assume-role-policy-document file://$role/$policy
        print $argv --tag=create-role --(state $status)
    else
        print --tag=create-role --failure "Expected to find policy at $role/$policy"
    end
end
