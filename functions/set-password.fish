function set-password --argument user password
    if empty "$user" "$password"
        usage set-password '<user>' '<password>'
        return (false)
    end

    if user-has-password $user
        aws iam update-login-profile --user-name $user --password $password --password-reset-required
    else
        aws iam create-login-profile --user-name $user --password $password --password-reset-required
    end
end
