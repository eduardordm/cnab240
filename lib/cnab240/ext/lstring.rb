require "bindata/base_primitive"

module BinData

  # I didn't want to monkey patch bindata's String primitive.
  class Lstring < BinData::BasePrimitive

    optional_parameters :read_length, :length, :trim_padding
    default_parameters :pad_byte => "\0"
    mutually_exclusive_parameters :read_length, :length
    mutually_exclusive_parameters :length, :value

    class << self

      def sanitize_parameters!(params) #:nodoc:
        params.warn_replacement_parameter(:initial_length, :read_length)

        params.warn_renamed_parameter(:pad_char, :pad_byte) # Remove this line in the future

        if params.has_parameter?(:pad_byte)
          byte = params[:pad_byte]
          params[:pad_byte] = sanitized_pad_byte(byte)
        end
      end

      #-------------
      private

      def sanitized_pad_byte(byte)
        result = byte.is_a?(Integer) ? byte.chr : byte_string(byte.to_s.dup)
        if result.length > 1
          raise ArgumentError, ":pad_byte must not contain more than 1 byte"
        end
        result
      end

      def byte_string(str)
        if RUBY_VERSION >= "1.9"
          str.force_encoding(Encoding::BINARY)
        else
          str
        end
      end
    end

    def assign(val)
      super(byte_string(val.dup))
    end

    def snapshot
      # override to trim padding
      result = super
      result = clamp_to_length(result)

      if get_parameter(:trim_padding)
        result = trim_padding(result)
      end
      result
    end

    #---------------
    private

    def byte_string(str)
      if RUBY_VERSION >= "1.9"
        str.force_encoding(Encoding::BINARY)
      else
        str
      end
    end

    def clamp_to_length(str)
      str = byte_string(str)

      len = eval_parameter(:length) || str.length
      if str.length == len
        str
      elsif str.length > len
        str.slice(0, len)
      else
        (eval_parameter(:pad_byte) * (len - str.length)) + str
      end
    end

    def trim_padding(str)
      str.sub(/#{eval_parameter(:pad_byte)}*$/, "")
    end

    def value_to_binary_string(val)
      clamp_to_length(val)
    end

    def read_and_return_value(io)
      len = eval_parameter(:read_length) || eval_parameter(:length) || 0
      io.readbytes(len)
    end

    def sensible_default
      ""
    end
  end
end
