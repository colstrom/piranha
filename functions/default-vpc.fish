function default-vpc
    aws ec2 describe-vpcs --filters Name=is-default,Values=true | jq --raw-output .Vpcs[].VpcId
end
