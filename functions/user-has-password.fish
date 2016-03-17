function user-has-password --argument user
    if empty "$user"
        usage user-has-password '<user>'
        return (false)
    end

    aws iam get-login-profile --user-name $user > /dev/null ^ /dev/null
end
