function real-roles
    trace (status --current-filename) $argv

    aws iam list-roles | jq --raw-output .Roles[].RoleName
end
