function delete-mfa --argument user
    if empty "$user"
        usage delete-mfa '<user>'
        return (false)
    end

    aws iam delete-virtual-mfa-device --serial-number (mfa-serial "$user")
end
