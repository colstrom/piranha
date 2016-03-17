function set-password --argument user password
    if empty "$user" "$password"
        usage set-password '<user>' '<password>'
        return (false)
    end

    if user-has-password $user
        reset-password $user $password
    else
        aws iam create-login-profile --user-name $user --password $password --password-reset-required
    end
end
