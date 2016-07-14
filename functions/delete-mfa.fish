function delete-mfa --argument user
    trace (status --current-filename) $argv

    if empty "$user"
        usage delete-mfa '<user>'
        return (false)
    end

    aws iam delete-virtual-mfa-device --serial-number (mfa-serial "$user")
end
