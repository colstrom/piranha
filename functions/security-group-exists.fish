function security-group-exists --argument group vpc
    trace (status --current-filename) $argv

    if empty $group
        usage security-group-exists '<group>' '[vpc]'
        return 23
    end

    if empty $vpc
        security-group-exists $group (default-vpc)
    end

    if string match --quiet 'vpc-*' $vpc
        if string match --quiet 'sg-*' $group
            contains $group (vpc security-groups $vpc)
        else
            contains $group (vpc security-groups $vpc | map security-group name)
        end
    else
        security-group-exists $group (lookup vpc $vpc)
    end
end
