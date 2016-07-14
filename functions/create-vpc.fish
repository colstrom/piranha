function create-vpc
    print-status vpc/create
    trace (status --current-filename) $argv

    aws ec2 create-vpc --cidr-block 10.10.10.0/24 | jq --raw-output .Vpc.VpcId
end
