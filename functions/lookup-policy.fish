function lookup-policy --argument name
    if empty "$name"
        usage lookup-policy '<name>'
        return (false)
    end

    aws iam list-policies | jq --raw-output ".Policies[] | select(.PolicyName == \"$name\") .Arn"
end
