function mfa-serials
    aws iam list-virtual-mfa-devices | jq --raw-output .VirtualMFADevices[].SerialNumber
end
