function create-subnet --argument vpc name
    trace (status --current-filename) $argv

    if empty "$vpc" "$name"
        usage create-subnet '<vpc-id>' '<name>'
        return (false)
    end

    set --local subnet vpcs/$vpc/subnets/$name
    set --local zone (get $subnet/availability-zone)
    set --local cidr (get $subnet/cidr-block)

    if empty "$zone"
        if test (printf $zone | wc -c) = 1
            if has region vpcs/$vpc
                set zone (get vpcs/$vpc/region)$zone
            else
                print-status error "Shorthand zone $zone requires an explicit region for the VPC."
                return 2
            end
        end

        if not contains $zone (availability-zones)
            print-status error "$zone is not a valid availability zone for this account or region."
            return 2
        end
    end
end
