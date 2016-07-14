function add-user-to-group --argument user group
    trace (status --current-filename) $argv

    if empty "$user" "$group"
        usage add-user-to-group '<user>' '<group>'
        return (false)
    end

    aws iam add-user-to-group --user-name $user --group-name $group
    print $argv --tag=add-user-to-group --(state $status)
end
