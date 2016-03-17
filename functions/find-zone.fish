function find-zone --argument domain
    if empty "$domain"
        usage find-zone '<domain>'
        return (false)
    end

    aws route53 list-hosted-zones-by-name | jq --raw-output ".HostedZones[] | select(.Name == \"$domain.\") .Id"
end
