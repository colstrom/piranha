function create-instance --argument vpc name
    trace (status --current-filename) $argv

    if empty "$vpc" "$name"
        usage create-instance '<vpc>' '<name>'
        return (false)
    end

    set instance "vpcs/$vpc/instances/$name"

    if has $name vpcs/$vpc/instances
        for property in (get $instance | grep -vE '(tags|user-data)' )
            set options $options --$property (get $instance/$property)
        end

        if has user-data $instance
            set options $options --user-data file://$instance/user-data
        end

        aws ec2 run-instances $options | jq --raw-output .Instances[].InstanceId//empty
    else
        return 1
    end
end
