function find-zone --argument domain
    trace (status --current-filename) $argv

    if empty "$domain"
        usage find-zone '<domain>'
        return (false)
    end

    aws route53 list-hosted-zones-by-name | jq --raw-output ".HostedZones[] | select(.Name == \"$domain.\") .Id"
end
