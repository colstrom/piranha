function vpc-create-subnet --argument vpc cidr availability_zone
    trace (status --current-filename) $argv

    if empty "$vpc" "$cidr"
        usage vpc-create-subnet '<vpc>' '<cidr>' '[availability-zone]'
        return (false)
    end

    aws ec2 create-subnet --vpc-id $vpc --cidr-block $cidr --availability-zone $availability_zone
end
