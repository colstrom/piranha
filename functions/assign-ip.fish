function assign-ip --argument vpc instance
    print-status assign-ip "$argv"
    if empty "$vpc" "$instance"
        usage assign-ip '<vpc>' '<instance>'
        return (false)
    end

    set --local ip (get vpcs/$vpc/instances/$instance/ip)

    empty $ip
    and set ip (unassigned-ips | head -n 1)

    empty $ip
    and set ip (create-ip)

    empty $ip
    and return 2

    echo aws ec2 associate-address --public-ip $ip --instance-id (lookup instance "$instance-$vpc")
end
