function managed-policy --argument document
    if empty "$document"
        stderr "usage: managed-policy <document>"
        return (false)
    end

    not inline-policy "$document"
    and contains (basename "$document") (list-managed-policies)
end
