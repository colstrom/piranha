function real-users-in-group --argument group
    trace (status --current-filename) $argv

    if empty "$group"
        usage real-users-in-group '<group>'
        return (false)
    end

    aws iam get-group --group-name "$group" | jq --raw-output .Users[].UserName | sort
    print $argv --tag=real-users-in-group --(state $status)
end
