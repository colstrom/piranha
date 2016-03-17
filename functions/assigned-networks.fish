function assigned-networks
    aws ec2 describe-vpcs | jq --raw-output '.Vpcs[].CidrBlock'
end
