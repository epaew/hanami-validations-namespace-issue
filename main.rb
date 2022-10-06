# frozen_string_literal: true

require 'hanami/validations'

module Validators
  class UserValidator
    include Hanami::Validations
  end
end

puts Validators::UserValidator.namespace.to_s #=> s.user_validator

# monkey patch for Ruby >= 2.5.0
module Hanami
  module Validations
    class Namespace
      private

      def name_without_suffix
        @name.delete_suffix(SUFFIX)
      end
    end
  end
end

puts Validators::UserValidator.namespace.to_s #=> validations.user
