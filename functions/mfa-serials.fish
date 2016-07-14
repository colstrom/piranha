function mfa-serials
    trace (status --current-filename) $argv

    aws iam list-virtual-mfa-devices | jq --raw-output .VirtualMFADevices[].SerialNumber
end
