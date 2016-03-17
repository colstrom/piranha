function elastic-ips --argument resource
    if empty "$resource"
        usage elastic-ips '<resource>'
        return (false)
    end

    set --local resource_type (echo "$resource" | cut -f 1 -d '-')
    if test "$resource_type" = 'eni'
        aws ec2 describe-network-interfaces --filters Name=network-interface-id,Values=$resource | jq --raw-output .NetworkInterfaces[].Association.PublicIp
    else
        set --local filter
        switch "$resource_type"
            case 'i'
                set filter instance-id
            case 'eipassoc'
                set filter association-id
            case 'eipalloc'
                set filter allocation-id
        end

        if test ! -z "$filter"
            aws ec2 describe-addresses --filters Name=$filter,Values=$resource | jq --raw-output .Addresses[].PublicIp
        else
            aws ec2 describe-addresses | jq --raw-output .Addresses[].PublicIp
        end
    end
end
