function real-vpcs
    aws ec2 describe-vpcs | jq --raw-output .Vpcs[].VpcId
end
