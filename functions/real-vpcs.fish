function real-vpcs
    trace (status --current-filename) $argv

    aws ec2 describe-vpcs | jq --raw-output .Vpcs[].VpcId
end
