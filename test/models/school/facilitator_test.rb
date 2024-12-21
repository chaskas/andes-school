require 'test_helper'

module School
  class FacilitatorTest < ActiveSupport::TestCase
    def setup
      @facilitator = School::Facilitator.new(
        name: 'Arturo Prat Chacon',
        phone: '+56932186725',
        email: 'art.chacon@gmail.com',
        address: '123 Main St, Viña del Mar, Chile',
        birthday: '1999-05-15'
      )
    end

    test 'should not save facilitator without name' do
      @facilitator.name = nil
      assert_not @facilitator.save, 'Saved the facilitator without a name'
    end

    test 'should not save facilitator with empty name' do
      @facilitator.name = ''
      assert_not @facilitator.save, 'Saved the facilitator with empty name'
    end

    test 'should contain only letters and spaces in name' do
      @facilitator.name = 'John123'
      assert_not @facilitator.save, 'Saved the facilitator with numbers in the name'

      @facilitator.name = 'John!Doe'
      assert_not @facilitator.save, 'Saved the facilitator with special characters in the name'

      @facilitator.name = 'John Doe'
      assert @facilitator.save, 'Failed to save the facilitator with a valid name'
    end

    test 'should not save facilitator without email' do
      @facilitator.email = nil
      assert_not @facilitator.save, 'Saved the facilitator without an email'
    end

    test 'should not save facilitator with empty email' do
      @facilitator.email = ''
      assert_not @facilitator.save, 'Saved the facilitator with empty email'
    end

    test 'should not save facilitator with invalid email' do
      @facilitator.email = 'invalid_email'
      assert_not @facilitator.save, 'Saved the facilitator with an invalid email'
    end

    test 'should not save facilitator without birthday' do
      @facilitator.birthday = nil
      assert_not @facilitator.save, 'Saved the facilitator without a birthday'
    end

    test 'should not save facilitator with empty birthday' do
      @facilitator.birthday = ''
      assert_not @facilitator.save, 'Saved the facilitator with empty birthday'
    end

    test 'should not save facilitator with a future birthday' do
      @facilitator.birthday = Date.tomorrow
      assert_not @facilitator.save, 'Saved the facilitator with a future birthday'
    end

    test 'should not save facilitator with a birthday more than 100 years ago' do
      @facilitator.birthday = 151.years.ago
      assert_not @facilitator.save, "Saved the facilitator with a birthday that's too old"
    end

    test 'should save facilitator with a valid birthday' do
      @facilitator.birthday = 50.years.ago
      assert @facilitator.save, 'Failed to save the facilitator with a valid birthday'
    end

    test 'should not save facilitator without phone' do
      @facilitator.phone = nil
      assert_not @facilitator.save, 'Saved the facilitator without a phone'
    end

    test 'should not save facilitator with empty phone' do
      @facilitator.phone = ''
      assert_not @facilitator.save, 'Saved the facilitator with empty phone'
    end

    test 'should not save facilitator with invalid phone format' do
      @facilitator.phone = 'phone123'
      assert_not @facilitator.save, 'Saved the facilitator with an invalid phone format'
    end

    test 'should save facilitator with valid phone' do
      @facilitator.phone = '+56932186725'
      assert @facilitator.save, 'Failed to save the facilitator with a valid phone'
    end

    test 'should not save facilitator without address' do
      @facilitator.address = nil
      assert_not @facilitator.save, 'Saved the facilitator without an address'
    end

    test 'should not save facilitator with empty address' do
      @facilitator.address = ''
      assert_not @facilitator.save, 'Saved the facilitator with empty address'
    end

    test 'should save facilitator with valid address' do
      @facilitator.address = '123 Main St'
      assert @facilitator.save, 'Failed to save the facilitator with a valid address'
    end

    test 'should save valid facilitator' do
      assert @facilitator.save, 'Failed to save a valid facilitator'
    end
  end
end
