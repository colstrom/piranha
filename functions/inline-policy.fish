function inline-policy --argument document
    if test -z "$document"
        stderr "usage: inline-policy <document>"
        return (false)
    end

    echo $document | grep -q '\.json$'
end
