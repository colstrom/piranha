function unassigned-ips
    aws ec2 describe-addresses | jq --raw-output '.Addresses[] | select(.InstanceId == null) .PublicIp'
end
