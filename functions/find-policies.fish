function find-policies --argument-names type target
    print-status iam/find-policies "$type $target"
    test -d iam/$type-policy/$target
    and find iam/$type-policy/$target -type f -name \*.json | rev | cut -d / -f 1 | rev | cut -d . -f 1
end
