function mfa-serial --argument user
    if empty "$user"
        usage mfa-serial '<user>'
        return (false)
    end

    mfa-serials | grep "arn:aws:iam::"(account-id)":mfa/$user"
end
