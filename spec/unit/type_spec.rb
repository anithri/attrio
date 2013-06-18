require 'spec_helper'

describe Attrio::Types::Base do
  let(:model) do
    Class.new do
      include Attrio

      define_attributes do
        attr :type_as_constant, Integer
        attr :type_in_options_as_constant, Integer
        attr :type_as_string, 'integer'
        attr :type_in_options_as_string, 'integer'
        attr :type_as_symbol, :integer
        attr :type_in_options_as_symbol, :integer
      end
    end
  end

  it 'should set appropriate type by all available options ' do
    model.attributes.values.each { |attribute| attribute.type.should be(Attrio::Types::Integer) }
  end
end