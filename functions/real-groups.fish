function real-groups
    aws iam list-groups | jq --raw-output .Groups[].GroupName
end
