function database-instance-create --argument name
    trace (status --current-filename) $argv

    if empty $name
        usage database-instance-create '<name>'
        return 23
    end

    if database instance exists $name
        print --warning "$name already exists"
    else
        if has $name databases
            set database databases/$name
            set flags
            for flag in db-instance-class engine engine-version master-username allocated-storage storage-type db-subnet-group-name
                set -- flags $flags --$flag (get $database/$flag)
            end

            for secret in master-user-password
                set -- flags $flags --$secret (get-secret $database/$secret)
            end

            if has multi-az $database
                set flags $flags --multi-az
            else
                set flags $flags --no-multi-az
            end

            set tags
            for tag in (get $database/tags)
                set tags $tags Key=$tag,Value=(get $database/tags/$tag)
            end

            if not empty $tags
                set -- flags $flags --tags $tags
            end

            aws rds create-db-instance --db-instance-identifier $name $flags
        else
            print --failure "No such file or directory: $database/$name"
        end
    end
end
