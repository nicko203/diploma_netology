variable "yandex_disk_id" {
  default = "fd8h34rub6pjpg4qgi8j" // ubuntu-1804-lts
}

variable "yandex_disk_id_nat" {
  default = "fd84mnpg35f7s7b0f5lg" // nat-instance-ubuntu-1804-lts
}


###################################################################################################################
# Defining proxy server settings
# For_each_v.2
variable "proxy_prod" {
  description = "Map of VMS names to configuration for PROD workspace"
  type        = map(any)
  default = {
    prod01 = {
      memory_size    = 4
      cores          = 4
      core_fraction = 100
      name           = "proxy-prod"
      hostname      = "proxy.sysad.su"
    }
  }
}
variable "proxy_stage" {
  description = "Map of VMS names to configuration for STAGE workspace"
  type        = map(any)
  default = {
    stage = {
      memory_size    = 2
      cores          = 2
      core_fraction  = 20
      name           = "proxy-stage"
      hostname      = "proxy.sysad.su"
    }
  }
}

###################################################################################################################
# Defining proxy-sql server settings

variable "proxy_sql_prod" {
  description = "Map of VMS names to configuration for PROD workspace"
  type        = map(any)
  default = {
    prod01 = {
      memory_size    = 4
      cores          = 4
      core_fraction = 100
      name           = "haproxy-prod"
      hostname      = "haproxy.sysad.su"

    }
  }
}

variable "proxy_sql_stage" {
  description = "Map of VMS names to configuration for STAGE workspace"
  type        = map(any)
  default = {
    stage = {
      memory_size    = 2
      cores          = 2
      core_fraction  = 20
      name           = "haproxy-stage"
      hostname      = "haproxy.sysad.su"
    }
  }
}

###################################################################################################################
# Defining app server settings

variable "app_prod" {
  description = "Map of VMS names to configuration for PROD workspace"
  type        = map(any)
  default = {
    prod01 = {
      memory_size    = 4
      cores          = 4
      core_fraction = 100
      name           = "app-prod"
      hostname      = "app.sysad.su"
    }
  }
}

variable "app_stage" {
  description = "Map of VMS names to configuration for STAGE workspace"
  type        = map(any)
  default = {
    stage = {
      memory_size    = 2
      cores          = 2
      core_fraction  = 20
      name           = "app-stage"
      hostname      = "app.sysad.su"
    }
  }
}

###################################################################################################################
# Defining gitlab server settings

variable "gitlab_prod" {
  description = "Map of VMS names to configuration for PROD workspace"
  type        = map(any)
  default = {
    prod01 = {
      memory_size    = 8
      cores          = 4
      core_fraction = 100
      name           = "gitlab-prod"
      hostname      = "gitlab.sysad.su"
      disk_size = 10
    }
  }
}

variable "gitlab_stage" {
  description = "Map of VMS names to configuration for STAGE workspace"
  type        = map(any)
  default = {
    stage = {
      memory_size    = 8
      cores          = 2
      core_fraction  = 20
      name           = "gitlab-stage"
      hostname      = "gitlab.sysad.su"
      disk_size = 10
    }
  }
}


###################################################################################################################
# Defining gitlab-runner server settings

variable "runner_prod" {
  description = "Map of VMS names to configuration for PROD workspace"
  type        = map(any)
  default = {
    prod01 = {
      memory_size    = 4
      cores          = 4
      core_fraction = 100
      name           = "runner-prod"
      hostname      = "runner.sysad.su"
      disk_size = 10
    }
  }
}

variable "runner_stage" {
  description = "Map of VMS names to configuration for STAGE workspace"
  type        = map(any)
  default = {
    stage = {
      memory_size    = 4
      cores          = 4
      core_fraction  = 20
      hostname      = "runner.sysad.su"
      name           = "runner-stage"
      disk_size = 10
    }
  }
}

###################################################################################################################
# Defining monitoring server settings

variable "monitoring_prod" {
  description = "Map of VMS names to configuration for PROD workspace"
  type        = map(any)
  default = {
    prod01 = {
      memory_size    = 4
      cores          = 4
      core_fraction = 100
      name           = "monitoring-prod"
      hostname      = "monitoring.sysad.su"
      disk_size = 10
    }
  }
}

variable "monitoring_stage" {
  description = "Map of VMS names to configuration for STAGE workspace"
  type        = map(any)
  default = {
    stage = {
      memory_size    = 4
      cores          = 4
      core_fraction  = 20
      hostname      = "monitoring.sysad.su"
      name           = "monitoring-stage"
      disk_size = 10
    }
  }
}

######################################################################################################################
# Defining the database servers

variable "db_prod" {
  description = "Map of VMS names to configuration for PROD workspace"
  type        = map(any)
  default = {
    db01 = {
      memory_size    = 4
      cores          = 4
      name           = "db01"
      hostname      = "db01.sysad.su"
      core_fraction = 100
      disk_size = 10
      ip = "192.168.10.31"
    },
    db02 = {
      memory_size    = 4
      cores          = 4
      name           = "db02"
      hostname      = "db02.sysad.su"
      core_fraction = 100
      disk_size = 10
      ip = "192.168.10.32"
    },
    db03 = {
      memory_size    = 4
      cores          = 4
      name           = "db03"
      hostname      = "db03.sysad.su"
      core_fraction = 100
      disk_size = 10
      ip = "192.168.10.33"
    }
  }
}
variable "db_stage" {
  description = "Map of VMS names to configuration for STAGE workspace"
  type        = map(any)
  default = {
    db01 = {
      memory_size    = 2
      cores          = 2
      name           = "db01"
      hostname      = "db01.sysad.su"
      core_fraction = 20
      disk_size = 5
      ip = "192.168.10.31"
    },
    db02 = {
      memory_size    = 2
      cores          = 2
      name           = "db02"
      hostname      = "db02.sysad.su"
      core_fraction = 20
      disk_size = 5
      ip = "192.168.10.32"
    },
    db03 = {
      memory_size    = 2
      cores          = 2
      name           = "db03"
      hostname      = "db03.sysad.su"
      core_fraction = 20
      disk_size = 5
      ip = "192.168.10.33"
    }

  }
}

