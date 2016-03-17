function user-access-keys --argument user
    if empty "$user"
        usage user-access-keys '<user>'
        return (false)
    end

    aws iam list-access-keys --user-name "$user" | jq --raw-output .AccessKeyMetadata[].AccessKeyId
end
