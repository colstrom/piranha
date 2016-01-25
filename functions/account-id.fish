function account-id
    aws ec2 describe-security-groups --filters Name=vpc-id,Values=(default-vpc) Name=group-name,Values=default | jq --raw-output .SecurityGroups[].OwnerId
end
