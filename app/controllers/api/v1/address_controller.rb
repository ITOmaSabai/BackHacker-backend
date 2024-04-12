class Api::V1::AddressController < ApplicationController
  def index
    addresses = Addresses.all
    render json: addresses
  end
end
