# encoding: utf-8

Puppet::Type.newtype(:network_snmp) do
  @doc = 'Manage snmp location, contact and enable SNMP on the device'

  apply_to_all

  newparam(:name, namevar: true) do
    desc 'The name of the Puppet resource, not used to manage the device'

    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end

  newproperty(:enable) do
    desc 'Enable or disable SNMP functionality [true|false]'
    newvalues(:true, :false)
  end

  newproperty(:contact) do
    desc 'The contact name for this device'
    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end

  newproperty(:location) do
    desc 'The location of this device'
    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end
end
