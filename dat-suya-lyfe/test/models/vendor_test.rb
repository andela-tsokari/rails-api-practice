require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'a vendor is valid with a name' do
    vendor = Vendor.create(name: 'Tams')

    assert vendor.valid?
    refute vendor.invalid?
  end

  test 'a vendor is not valid without a name' do
    vendor = Vendor.create(name: 'Tams')
    vendor.name = nil
    vendor.save

=begin
    require 'pry';
    binding.pry
=end
    refute vendor.errors.empty?
    assert vendor.invalid?
    refute vendor.valid?
  end

  test 'a vendor is not valid without a name, using \'new\' method' do
    vendor = Vendor.new(name: 'Tams')
    vendor.name = nil
    vendor.save

    assert vendor.invalid?
    refute vendor.valid?
  end

  test 'a vendor\'s name can only be between 2 and 20 characters long' do
    vendor1 = Vendor.create(name: 'a')
    vendor2 = Vendor.create(name: 'four')
    vendor3 = Vendor.create(name: 'ThisNameIsThirtyLength30303030')

    assert vendor1.invalid?
    assert vendor3.invalid?
    assert vendor2.valid?
  end

  test 'vendors have to have unique names' do
    vendor1 = Vendor.create(name: 'Tams')
    vendor2 = Vendor.create(name: 'Tams')

    assert vendor1.valid?
    assert vendor2.invalid?
  end

  test 'a vendor can have many suyas' do
    vendor = Vendor.create(name: 'Tams')
    beef_suya = Suya.create(meat: 'beef', spicy: true)
    kidney_suya = Suya.create(meat: 'kidney', spicy: false)

    vendor.suyas << beef_suya
    vendor.suyas << kidney_suya

    assert_equal 2, vendor.suyas.count
  end

  test 'a vendor can have many suyas, using array method' do
    vendor = Vendor.create(name: 'Tams')
    beef_suya = Suya.create(meat: 'beef', spicy: true)
    kidney_suya = Suya.create(meat: 'kidney', spicy: false)

    vendor.suyas = [beef_suya, kidney_suya]

    assert_equal 2, vendor.suyas.count
  end
end
