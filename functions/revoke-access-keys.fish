function revoke-access-keys --argument user
    trace (status --current-filename) $argv

    if empty "$user"
        usage revoke-access-keys '<user>'
        return (false)
    end

    for key in (user-access-keys "$user")
        revoke-access-key "$user" "$key"
    end
end
