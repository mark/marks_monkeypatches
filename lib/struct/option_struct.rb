module OptionStruct

  def self.new(*params)
    Struct.new(*params) do
      def initialize(*args)
        option_args = args.map { |obj| maybe(obj) }
        super(*option_args)
      end
    end
  end

end
