module "base" {
  source   = "../../modules/test"
  siteId   = basename(abspath(path.module))
  location = "eastus"
}
