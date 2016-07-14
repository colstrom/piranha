function apply-security-group-rules --argument vpc name
    trace (status --current-filename) $argv

    if empty "$vpc" "$name"
        usage apply-security-group-rules '<vpc>' '<name>'
        return (false)
    end

    set group "vpcs/$vpc/security-groups/$name"

    if has group-id $group
        set group_id (get $group/group-id)

        get $group/ingress | while read protocol port origin
            if empty "$protocol" "$port" "$origin"
                print --failure malformed entry in $group/ingress
                return (false)
            end

            switch $origin
                case 'sg-*'
                    set type source-group
                case '*'
                    set type cidr
            end

            aws ec2 authorize-security-group-ingress --group-id $group_id --protocol $protocol --port $port --$type $origin
        end

    else
        store $group/group-id (security-group lookup $name $vpc)
        apply-security-group-rules $vpc $name
    end
end
