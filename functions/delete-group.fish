function delete-group --argument group
    trace (status --current-filename) $argv

    if empty "$group"
        usage delete-group '<group>'
        return (false)
    end

    for policy in (attached-policies group "$group")
        detach-policy group "$group" "$policy"
    end

    for user in (real-users-in-group "$group")
        delete-from-group "$group" "$user"
    end

    aws iam delete-group --group-name "$group"
    print $argv --tag=delete-group --(state $status)
end
