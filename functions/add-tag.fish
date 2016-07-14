function add-tag --argument resource
    trace (status --current-filename) $argv

    switch (count $argv)
        case 2
            set key Name
            set value $argv[1]
            set resource $argv[2]
        case 3
            set key $argv[1]
            set value $argv[2]
            set resource $argv[3]
        case '*'
            usage add-tag '(<name> | <key> <value>) <resource>'
            return 23
    end

    aws ec2 create-tags --resource $resource --tags Key=$key,Value=$value
end
