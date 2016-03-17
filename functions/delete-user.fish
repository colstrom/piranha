function delete-user --argument user
    if empty "$user"
        usage delete-user '<user>'
        return (false)
    end

    if contains "$user" (real-users)
        for group in (user-in-groups "$user")
            delete-from-group "$group" "$user"
        end

        revoke-access-keys "$user"
        unset-password "$user"
        deactivate-mfa "$user"
        aws iam delete-user --user-name "$user"
    end
end
