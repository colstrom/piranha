function availability-zones
    aws ec2 describe-availability-zones | jq --raw-output .AvailabilityZones[].ZoneName
end
