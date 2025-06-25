require "test_helper"

module School
  class ParticipantTest < ActiveSupport::TestCase
    
    def setup
      @participant = School::Participant.new(name: "Agustin Arturo Prat Chacon", email: "capitan.prat.48@gmail.com", birthday: "1998-03-04")
    end

    test "should not save participant without name" do
      @participant.name = nil
      assert_not @participant.save, "Saved the participant without a name"
    end

    test "should not save participant with empty name" do
      @participant.name = ''
      assert_not @participant.save, "Saved the participant with empty name"
    end

    test "should contain only letters and spaces" do
      @participant.name = 'Arturo123'
      assert_not @participant.save, "Saved the participant with numbers in the name"
    
      @participant.name = 'Arturo!Prat'
      assert_not @participant.save, "Saved the participant with special characters in the name"
    
      @participant.name = 'Agustin Arturo Prat Chacon'
      assert @participant.save, "Failed to save the participant with a valid name"
    end

    test "should not save participant without email" do
      @participant.email = nil
      assert_not @participant.save, "Saved the participant without an email"
    end

    test "should not save participant with invalid email" do
      @participant.email = "invalid_email"
      assert_not @participant.save, "Saved the participant with an invalid email"
    end

    test "should not save participant with a future birthday" do
      @participant.birthday = Date.tomorrow
      assert_not @participant.save, "Saved the participant with a future birthday"
    end

    test "should not save participant with a birthday more than 100 years ago" do
      @participant.birthday = 151.years.ago
      assert_not @participant.save, "Saved the participant with a birthday that's too old"
    end

    test "should save participant with a valid birthday" do
      @participant.birthday = 50.years.ago
      assert @participant.save, "Failed to save the participant with a valid birthday"
    end

    test "should save valid participant" do
      assert @participant.save, "Failed to save a valid participant"
    end

  end
end
