function add-tag-to-vpc --argument-names resource key value
    print-status vpc/add-tag "$argv"
    for argument in resource key value
        if empty "$$argument"
            print-status usage "add-tag-to-vpc <vpc-id> <key> <value>"
            return -1
        end
    end

    and aws ec2 create-tags --resources $resource --tags Key=$key,Value=$value
end
