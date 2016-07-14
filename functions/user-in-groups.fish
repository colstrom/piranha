function user-in-groups --argument user
    trace (status --current-filename) $argv

    if empty "$user"
        usage user-in-groups '<user>'
        return (false)
    end

    aws iam list-groups-for-user --user-name "$user" ^ /dev/null | jq --raw-output .Groups[].GroupName
end
