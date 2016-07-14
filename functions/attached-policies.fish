function attached-policies --argument type name
    trace (status --current-filename) $argv

    if empty "$type" "$name"
        usage attached-policies '<type>' '<name>'
        return (false)
    end

    aws iam list-attached-$type-policies --$type-name "$name" | jq --raw-output .AttachedPolicies[].PolicyName
    print $argv --tag=attached-policies --$(state $status)
end
