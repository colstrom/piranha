function delete-from-group --argument group user
    if empty "$group" "$user"
        usage delete-from-group '<group>' '<user>'
        return (false)
    end

    print-status delete-from-group "$argv"

    aws iam remove-user-from-group --group-name "$group" --user-name "$user"
end
