function real-users-in-group --argument group
    if empty "$group"
        usage real-users-in-group '<group>'
        return (false)
    end

    print-status real-users-in-group "$argv"

    aws iam get-group --group-name "$group" | jq --raw-output .Users[].UserName | sort
end
