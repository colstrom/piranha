function list-managed-policies
    trace (status --current-filename) $argv

    aws iam list-policies | jq --raw-output .Policies[].PolicyName
end
