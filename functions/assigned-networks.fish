function assigned-networks
    trace (status --current-filename) $argv

    aws ec2 describe-vpcs | jq --raw-output '.Vpcs[].CidrBlock'
end
