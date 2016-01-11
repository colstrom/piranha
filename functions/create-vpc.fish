function create-vpc
    print-status vpc/create
    aws ec2 create-vpc --cidr-block 10.10.10.0/24 | jq --raw-output .Vpc.VpcId
end
