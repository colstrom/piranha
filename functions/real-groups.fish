function real-groups
    trace (status --current-filename) $argv

    aws iam list-groups | jq --raw-output .Groups[].GroupName
end
