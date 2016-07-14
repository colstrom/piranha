function unassigned-ips
    trace (status --current-filename) $argv

    aws ec2 describe-addresses | jq --raw-output '.Addresses[] | select(.InstanceId == null) .PublicIp'
end
