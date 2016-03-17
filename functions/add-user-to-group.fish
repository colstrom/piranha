function add-user-to-group --argument user group
    if empty "$user" "$group"
        usage add-user-to-group '<user>' '<group>'
        return (false)
    end

    print-status add-user-to-group "$user $group"
    aws iam add-user-to-group --user-name $user --group-name $group
end
