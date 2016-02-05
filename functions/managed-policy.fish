function managed-policy --argument document
    if test -z "$document"
        stderr "usage: managed-policy <document>"
        return (false)
    end

    not inline-policy "$document"
    and contains (basename "$document") (list-managed-policies)
end
