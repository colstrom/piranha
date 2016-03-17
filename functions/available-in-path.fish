function available-in-path --argument command
    if empty "$command"
        usage available-in-path '<command>'
        return (false)
    end

    which -s $command
end
