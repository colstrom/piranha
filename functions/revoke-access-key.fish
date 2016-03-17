function revoke-access-key --argument user key
    if empty "$user" "$key"
        usage revoke-access-key '<user>' '<key>'
        return (false)
    end

    aws iam delete-access-key --user-name "$user" --access-key-id "$key"
end
