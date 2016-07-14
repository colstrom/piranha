function user-has-password --argument user
    trace (status --current-filename) $argv

    if empty "$user"
        usage user-has-password '<user>'
        return (false)
    end

    aws iam get-login-profile --user-name $user > /dev/null ^ /dev/null
end
