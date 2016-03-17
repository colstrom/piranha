function apply-policy --argument document
    print-status apply-policy "$document"
    if empty "$document"
        usage apply-policy '<document>'
        return (false)
    end

    set --local type (basename (parent $document 3 | sed 's/s$//'))
    set --local target (basename (parent $document 2))
    set --local policy (basename -s .json $document)

    if managed-policy $document
        aws iam attach-$type-policy --$type-name $target --policy-arn (lookup-policy $policy)
    else
        switch $type
            case user group
                aws iam put-$type-policy --$type-name $target --policy-name $policy --policy-document file://$document
            case bucket
                aws s3api put-bucket-policy --bucket $target --policy file://$document
        end
    end
end
