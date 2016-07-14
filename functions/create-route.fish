function create-route --argument cidr gateway table
    trace (status --current-filename) $argv

    if empty "$cidr" "$gateway" "$table"
        usage create-route '<cidr>' '<gateway>' '<route-table>'
        return 23
    end

    set vpc (route-table vpc-id $table)

    switch $gateway
        case 'igw'
            set gateway --gateway (vpc internet-gateway $vpc)
        case 'igw-*'
            set gateway --gateway $gateway
    end

    aws ec2 create-route --route-table-id $table --destination-cidr-block $cidr $gateway | jq --exit-status .Return
end
