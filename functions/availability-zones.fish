function availability-zones
    trace (status --current-filename) $argv

    aws ec2 describe-availability-zones | jq --raw-output .AvailabilityZones[].ZoneName
end
