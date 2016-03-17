function inline-policy --argument document
    if empty "$document"
        usage inline-policy '<document>'
        return (false)
    end

    echo $document | grep -q '\.json$'
end
