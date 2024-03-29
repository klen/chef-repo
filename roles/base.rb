name "base"
description "Base role applied to all nodes."
run_list(
    "recipe[users::sysadmins]",
    "recipe[sudo]",
    "recipe[apt]",
    "recipe[git]",
    "recipe[build-essential]",
    "recipe[logrotate]",
    "recipe[locale-gen]",
    "recipe[python]",
    "recipe[curl]",
    "recipe[nodejs]",
    "recipe[vim]"
) 
override_attributes(
    :authorization => {
        :sudo => {
            :users => ["ubuntu", "vagrant"],
            :passwordless => true
        }
    },
    :localegen => {
        :lang => ["en_US.UTF-8", "ru_RU.UTF-8"]
    }
)
