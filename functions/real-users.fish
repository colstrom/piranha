function real-users
    aws iam list-users | jq --raw-output .Users[].UserName
end
