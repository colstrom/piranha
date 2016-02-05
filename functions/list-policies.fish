function list-policies
    aws iam list-policies | jq --raw-output .Policies[].PolicyName
end
