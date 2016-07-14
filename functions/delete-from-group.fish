function delete-from-group --argument group user
    trace (status --current-filename) $argv

    if empty "$group" "$user"
        usage delete-from-group '<group>' '<user>'
        return (false)
    end

    aws iam remove-user-from-group --group-name "$group" --user-name "$user"
    print $argv --tag=delete-from-group --(state $status)
end
