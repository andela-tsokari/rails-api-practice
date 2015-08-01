require 'test_helper'

class SuyaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'suya is valid with a \'meat\' type and \'spicy\' status' do
    suya = Suya.create(meat: 'beef', spicy: false)

    assert suya.valid?

    # suya.save

    assert_equal 3, Suya.count
  end

  test 'suya is not valid without a meat' do
    suya = Suya.create(meat: nil, spicy: true)

    assert suya.invalid?
    refute suya.valid?
  end

  test 'suya is not valid without a spiciness level' do
    suya = Suya.create(meat: 'beef', spicy: nil)

    assert suya.invalid?
  end

  test 'suya belongs to a vendor' do
    vendor = Vendor.create(name: 'Tams')
    suya = Suya.create(meat: 'Chicken', spicy: nil)

    suya.vendor = vendor
    refute suya.vendor.blank?
    assert_equal 'Tams', suya.vendor.name
  end
end
