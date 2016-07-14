function available-in-path --argument command
    trace (status --current-filename) $argv

    if empty "$command"
        usage available-in-path '<command>'
        return (false)
    end

    which -s $command
end
