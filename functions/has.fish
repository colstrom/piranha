function has --argument key resource
    if empty "$key" "$resource"
        usage has '<key>' '<resource>'
        return (false)
    end

    contains $key (get $resource)
end
