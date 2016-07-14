function managed-policy --argument document
    trace (status --current-filename) $argv

    if empty "$document"
        usage managed-policy '<document>'
        return (false)
    end

    not inline-policy "$document"
    and contains (basename "$document") (list-managed-policies)
end
