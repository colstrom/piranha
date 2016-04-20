function ip-instance --argument public_ip
    if empty "$public_ip"
        usage ip-instance '<public-ip>'
        return (false)
    end

    aws ec2 describe-instances | jq --raw-output ".Reservations[].Instances[] | select(.PublicIpAddress == \"$public_ip\") .InstanceId"
end
