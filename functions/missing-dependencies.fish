function missing-dependencies
    for dependency in aws jq
        not available-in-path $dependency
        and echo $dependency
    end
end
