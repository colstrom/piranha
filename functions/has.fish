function has --argument-names key resource
    if empty "$key" "$resource"
        usage has '<key>' '<resource>'
        return (false)
    end

    contains $key (get $resource)
end
