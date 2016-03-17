function real-roles
    aws iam list-roles | jq --raw-output .Roles[].RoleName
end
