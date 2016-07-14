function default-vpc
    trace (status --current-filename) $argv

    aws ec2 describe-vpcs --filters Name=is-default,Values=true | jq --raw-output .Vpcs[].VpcId
end
