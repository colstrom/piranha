function real-users
    trace (status --current-filename) $argv

    aws iam list-users | jq --raw-output .Users[].UserName
end
