provider "digitalocean" {
  token = var.do_token
}

module "droplet" {
  source = "./modules/droplet"
  ssh_fingerprint = var.ssh_fingerprint
  cluster_size = var.cluster_size
  datacenter = var.datacenter
}

module "firewall" {
  source = "./modules/firewall"
  server_ids = module.droplet.server_ids
}

module "nomad" {
  source = "./modules/nomad"
  nomad_ip = module.droplet.nomad_ip
  nomad_addr = "http://${module.droplet.nomad_ip}:4646"
}

module "local" {
  source = "./modules/local"
  nomad_ip = module.droplet.nomad_ip
  nomad_ip_private = module.droplet.nomad_ip_private
}
