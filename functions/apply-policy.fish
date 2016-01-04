function apply-policy --argument-names type target policy
    print-status iam/apply-policy "$type $target $policy"
    aws iam put-$type-policy --$type-name $target --policy-name $policy --policy-document file://iam/$type-policy/$target/$policy.json
end
