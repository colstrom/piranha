function reset-password --argument user password
    if empty "$user" "$password"
        usage reset-password '<user>' '<password>'
        return (false)
    end

    aws iam update-login-profile --user-name $user --password $password --password-reset-required
end
