function list-managed-policies
    aws iam list-policies | jq --raw-output .Policies[].PolicyName
end
