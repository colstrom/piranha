function lookup --argument resource
    trace (status --current-filename) $argv

    set --local key
    set --local value

    switch (count $argv)
        case 2
            set key Name
            set value $argv[2]
        case 3
            set key $argv[2]
            set value $argv[3]
        case '*'
            usage lookup '<resource> (<name> | [key] <value>)'
            return (false)
    end

    set result (aws ec2 describe-tags --filters Name=resource-type,Values=$resource Name=tag:$key,Values=$value | jq --raw-output .Tags[].ResourceId | sort -u)

    if test (count $result) -gt 0
        echo $result
    else
        false
    end
end
