# Terraform for Nomad on DigitalOcean

**NOTE: This is an experiment, please only use for reference**

```bash
# How to use
terraform init
terraform apply
```

You will be prompted for a DigitalOcean token, SSH fingerprint, and custer size (1, 3 or 5).

## Current Status

This currently installs the following:

- `nomad`, configured as both client/server
- DigitalOcean firewall

## Connecting

Droplet communication is restricted to internal IP, so an SSH tunnel is required to interact with it from outside the network.

```bash
ssh -N -L "4646:${DROPLET_PRIVATE_IP}:4646" "root@${PUBLIC_DROPLET_IP}"
```
