function apply-policies --argument-names type target
    print-status iam/apply-policies "$type $target"
    for policy in (find-policies $type $target)
        apply-policy $type $target $policy
    end
end
