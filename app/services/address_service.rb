class AddressService
  def self.save_address_from_address_components(address_components, formatted_address, spot_id)
    country = extract_long_name_by_type(address_components, 'country')
    administrative_area_level_1 = extract_long_name_by_type(address_components, 'administrative_area_level_1')

    address = Address.create(
      country: country,
      administrative_area_level_1: administrative_area_level_1,
      formatted_address: formatted_address,
      spot_id: spot_id
    )
    return address, country, administrative_area_level_1
  end

  private

  def self.extract_long_name_by_type(address_components, type)
    # return nil unless address_components.is_a?(Array)

    component = address_components.find { |component| component['types'].include?(type) }
    component ? component['long_name'] : nil
  end
end