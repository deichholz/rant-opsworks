#
# Cookbook Name:: rs_cassandra
# Libraries:: config_helpers
#

def rs_cassandra_bool_config(config_val)
  if config_val.is_a?(String) then
    return config_val
  elsif config_val then
    return "true"
  else
    return "false"
  end
end
