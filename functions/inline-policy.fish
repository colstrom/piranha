function inline-policy --argument document
    trace (status --current-filename) $argv

    if empty "$document"
        usage inline-policy '<document>'
        return (false)
    end

    echo $document | grep -q '\.json$'
end
