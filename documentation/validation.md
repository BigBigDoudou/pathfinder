```ruby
class Validation
  include ValidationHelper

  attr_reader :errors
  def initialize(params = {})
    @serial = params[:serial]
    @width = params[:width]
    @errors = []
  end

  def valid?
    validate
    @errors.empty?
  end

  private

  def validate
    validate_serial
    validate_width
    validate_allowed_characters
    validate_start_and_finish
    validate_rectangle
  end

  def trustable_serial?
    @serial.present? &&
      @serial.respond_to?('to_s') &&
      @serial.respond_to?('length')
  end

  def trustable_width?
    @width.present? &&
      @width.respond_to?('to_i') &&
      @width&.to_i&.positive?
  end

  def validate_serial
    return nil if trustable_serial?

    @errors << serial_error
  end

  def validate_width
    return nil if trustable_width?

    @errors << width_error
  end

  def validate_allowed_characters
    return nil if trustable_serial? &&
                  @serial.to_s =~ regex_characters

    @errors << allowed_characters_error
  end

  def validate_start_and_finish
    return nil if trustable_serial? &&
                  @serial.to_s =~ regex_start &&
                  @serial.to_s =~ regex_finish

    @errors << start_and_finish_error
  end

  def validate_rectangle
    return nil if trustable_serial? &&
                  trustable_width? &&
                  (@serial.length % @width.to_i).zero?

    @errors << rectangle_error
  end
end
```
