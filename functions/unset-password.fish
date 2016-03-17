function unset-password --argument user
    if empty "$user"
        usage unset-password '<user>'
        return (false)
    end

    if user-has-password "$user"
        aws iam delete-login-profile --user-name "$user"
    end
end
