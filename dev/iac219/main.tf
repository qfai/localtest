module "base" {
  source   = "../../modules/export"
  siteId   = basename(abspath(path.module))
  location = "eastus"
}
