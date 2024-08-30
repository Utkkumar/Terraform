terraform {
  backend "http" {
    address = "https://objectstorage.ap-mumbai-1.oraclecloud.com/p/3If34i501STiswqIuQ9bDXsO09RoEzbrQKqhYA5TtOwrsXphbrY1E4EUuV2HwE8S/n/bmux0xdewl4u/b/terraform-bucket/o/"
    update_method = "PUT"
  }
}
