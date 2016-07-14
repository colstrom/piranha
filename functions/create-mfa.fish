function create-mfa --argument user method
    trace (status --current-filename) $argv

    if empty "$user"
        usage create-mfa '<user>'
        return 23
    end

    if contains "$method" qt qrcode png QRCodePNG
        set method QRCodePNG
        set extension png
    else
        set method Base32StringSeed
        set extension seed
    end

    set filename "secrets/users/$user/mfa.$extension"

    mkdir -p (dirname $filename)

    aws iam create-virtual-mfa-device --virtual-mfa-device-name $user --outfile $filename --bootstrap-method $method
end
