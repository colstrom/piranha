function describe --argument key
    if empty "$key"
        usage describe '<key>'
        return (false)
    end

    if test -e $key
        switch (uname -s)
            case Darwin
                if which -s gstat
                    gstat -c '%F' $key
                else
                    set type (stat -f '%HT' $key)

                    switch $type
                        case 'Directory'
                            echo 'directory'
                        case 'Fifo File'
                            echo 'fifo'
                        case 'Regular File'
                            if test (stat -f '%z' $key) = 0
                                echo 'regular empty file'
                            else
                                echo 'regular file'
                            end
                        case 'Socket'
                            echo 'socket'
                        case 'Symbolic Link'
                            echo 'symbolic link'
                        case '*'
                            echo type
                    end
                end
            case '*'
                stat -c '%F' $key
        end
    else
        return 1
    end
end
