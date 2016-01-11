function update
    if contains all $argv
        update roles users groups buckets vpcs
    end

    for target in $argv
        switch $target
            case roles
                update-roles
            case users
                update-users
            case groups
                update-groups
            case buckets
                update-buckets
            case vpcs
                update-vpcs
        end
    end
end
