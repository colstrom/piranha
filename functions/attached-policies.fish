function attached-policies --argument type name
    if empty "$type" "$name"
        usage attached-policies '<type>' '<name>'
        return (false)
    end

    print-status attached-policies "$argv"

    aws iam list-attached-$type-policies --$type-name "$name" | jq --raw-output .AttachedPolicies[].PolicyName
end
