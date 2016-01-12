function get --argument-names key
    if test -z "$key"
        print-status usage 'get <key>'
        return -1
    end

    if test -e $key
        switch (describe $key)
            case 'directory'
                find $key -mindepth 1 -maxdepth 1 -exec basename '{}' \; | grep -vE '^\.|^README\.md$'
            case '*'
                cat $key
        end
    else
        return 1
    end
end
