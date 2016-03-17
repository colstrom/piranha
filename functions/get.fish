function get --argument key
    if empty "$key"
        usage get '<key>'
        return (false)
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
