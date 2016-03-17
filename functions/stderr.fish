function stderr
    if empty "$argv"
        while read --local --array line
            echo $line >& 2
        end
    else
        for line in $argv
            echo $line >& 2
        end
    end
end
