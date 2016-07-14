function missing-dependencies
    trace (status --current-filename) $argv

    for dependency in aws jq
        not available-in-path $dependency
        and echo $dependency
    end
end
