function detach-policy --argument type name policy
    trace (status --current-filename) $argv

    if empty "$type" "$name" "$policy"
        usage detach-policy '<type>' '<name>' '<policy>'
        return (false)
    end

    aws iam detach-$type-policy --$type-name "$name" --policy-arn (lookup-policy "$policy")
    print $argv --tag=detach-policy --(state $status)
end
